package org.modelcatalogue.core.security

import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.SpringSecurityUtils
import grails.plugin.springsecurity.acl.AclService
import grails.plugin.springsecurity.acl.AclUtilService
import grails.transaction.Transactional
import groovy.transform.CompileDynamic
import org.modelcatalogue.core.CatalogueElement
import org.modelcatalogue.core.DataModel
import org.modelcatalogue.core.persistence.UserGormService
import org.springframework.security.acls.domain.BasePermission
import org.springframework.security.acls.model.NotFoundException
import org.springframework.security.acls.model.Permission
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import org.springframework.security.core.Authentication
import org.springframework.security.core.userdetails.UserDetails
import org.springframework.security.core.userdetails.UserDetailsService
import org.springframework.transaction.annotation.Propagation
import org.springframework.security.acls.model.MutableAcl
import org.springframework.security.acls.model.AccessControlEntry
import org.springframework.security.acls.domain.PrincipalSid

class DataModelAclService {

    AclUtilService aclUtilService

    AclService aclService

    SpringSecurityService springSecurityService

    UserDetailsService userDetailsService

    UserGormService userGormService

    boolean hasReadPermission(Object instance) {
        DataModel dataModel = dataModelFromInstance(instance)
        if ( dataModel == null ) {
            return true
        }
        hasReadPermission(dataModel)
    }

    boolean hasReadPermission(DataModel dataModel, String username) {
        hasPermission(dataModel, username, [BasePermission.READ, BasePermission.ADMINISTRATION] as Permission[])
    }

    boolean hasAdministrationPermission(DataModel dataModel, String username) {
        hasPermission(dataModel, username, [BasePermission.ADMINISTRATION] as Permission[])
    }

    boolean hasReadPermission(DataModel dataModel) {
        hasPermission(dataModel, [BasePermission.READ, BasePermission.ADMINISTRATION] as Permission[])
    }

    boolean isAdminOrHasAdministrationPermission(Object instance) {
        if ( SpringSecurityUtils.ifAnyGranted(MetadataRoles.ROLE_SUPERVISOR) ) {
            return true
        }
        hasAdministratorPermission(instance)
    }

    boolean isAdminOrHasReadPermission(Object instance) {
        if ( SpringSecurityUtils.ifAnyGranted(MetadataRoles.ROLE_SUPERVISOR) ) {
            return true
        }
        hasReadPermission(instance)
    }

    boolean hasAdministratorPermission(Object instance) {
        DataModel dataModel = dataModelFromInstance(instance)
        if ( dataModel == null ) {
            return true
        }
        hasAdministratorPermission(dataModel)
    }

    boolean hasAdministratorPermission(DataModel dataModel) {
        hasPermission(dataModel, BasePermission.ADMINISTRATION)
    }

    boolean hasPermission(DataModel dataModel, Permission... permissions) {
        Authentication authentication = springSecurityService.authentication
        if ( authentication == null ) {
            return false
        }
        hasPermission(dataModel, authentication, permissions)
    }

    boolean hasPermission(DataModel dataModel, Authentication authentication, Permission... permissions) {
        if ( dataModel == null) {
            return true
        }

        aclUtilService.hasPermission(authentication, dataModel, permissions)
    }

    boolean hasPermission(DataModel dataModel, String username, Permission... permissions) {
        Authentication authentication = authenticationByUsername(username)
        hasPermission(dataModel, authentication, permissions)
    }

    Authentication authenticationByUsername(String username) {
        UserDetails userDetails = userDetailsService.loadUserByUsername(username)
        new UsernamePasswordAuthenticationToken(userDetails, userDetails.password, userDetails.authorities)
    }

    boolean isAdminOrHasAdministratorPermission(DataModel dataModel) {
        if ( SpringSecurityUtils.ifAnyGranted(MetadataRoles.ROLE_SUPERVISOR) ) {
            return true
        }
        hasAdministratorPermission(dataModel)
    }

    DataModel dataModelFromInstance(Object instance) {
        if ( instance instanceof DataModel ) {
            return instance
        } else if ( instance instanceof CatalogueElement ) {
            return instance.dataModel
        }
        null
    }

    boolean isAdminOrHasAdministratorPermission(Object instance) {
        if ( SpringSecurityUtils.ifAnyGranted(MetadataRoles.ROLE_SUPERVISOR) ) {
            return true
        }

        DataModel dataModel = dataModelFromInstance(instance)

        if ( !dataModel ) {
            return true
        }
        hasAdministratorPermission(dataModel)
    }

    void addAdministrationPermission(DataModel dataModel) {
        addPermission(dataModel, BasePermission.ADMINISTRATION)
    }

    void addAdministrationPermission(DataModel dataModel, String username) {
        addPermission(dataModel, BasePermission.ADMINISTRATION, username)
    }

    void addAdministrationPermission(Long dataModelId) {
        addPermission(dataModelId, BasePermission.ADMINISTRATION)
    }

    void addReadPermission(DataModel dataModel) {
        addPermission(dataModel, BasePermission.READ)
    }


    void addReadPermission(DataModel dataModel, String username) {
        addPermission(dataModel, BasePermission.READ, username)
    }

    @Transactional(propagation = Propagation.REQUIRED)
    void addPermission(Long dataModelId, Permission permission) {
        String username = loggedUsername()
        if ( username == null ) {
            log.warn 'username is not set, cannot add permission'
            return
        }
        aclUtilService.addPermission(DataModel, dataModelId, username, permission)
    }

    // REQUIRES_NEW: Independent physical transaction for each nested method call
    @Transactional(propagation = Propagation.REQUIRED)
    void addPermission(DataModel dataModel, Permission permission) {

        String username = loggedUsername()
        if ( username == null ) {
            log.warn 'username is not set, cannot add permission'
            return
        }

        addPermission(dataModel, permission, username)
    }

    @Transactional(propagation = Propagation.REQUIRED)
    void addPermission(DataModel dataModel, Permission permission, String username) {
        if ( hasPermission(dataModel, username, permission) ) {
            return
        }
        try {
            aclUtilService.addPermission(dataModel, username, permission)
        } catch ( NotFoundException e ) {
            log.warn 'NotFoundException captured while trying to add permission for data model: ' + (dataModel?.name ?: '') + " username: " + username
        }
    }

    void copyPermissions(DataModel sourceModel, DataModel destinationModel){
        List<User> allUsers = userGormService.findAll([:])

        allUsers.each {user ->
            if (hasReadPermission(sourceModel, user.username)) {
                addReadPermission(destinationModel, user.username)
            }
            if (hasAdministrationPermission(sourceModel, user.username)) {
                addAdministrationPermission(destinationModel, user.username)
            }
        }
//
//        if ( hasReadPermission(sourceModel) ) {
//            addReadPermission(destinationModel)
//        }
//        if ( hasAdministratorPermission(sourceModel) ) {
//            addAdministrationPermission(destinationModel)
//        }
    }

    @CompileDynamic
    String loggedUsername() {
        if ( springSecurityService.principal instanceof String ) {
            return springSecurityService.principal
        }
        springSecurityService.principal?.username
    }

    void removePermissions(DataModel dataModel) {
        if ( hasReadPermission(dataModel) ) {
            aclUtilService.deletePermission(dataModel, loggedUsername(), BasePermission.READ)
        }
        if ( hasAdministratorPermission(dataModel) ) {
            aclUtilService.deletePermission(dataModel, loggedUsername(), BasePermission.ADMINISTRATION)
        }
    }

    @Transactional
    void removeDuplicatedPermissions(DataModel dataModel) {
        log.info "removing duplicate permissions for ${dataModel.name} ${dataModel.modelCatalogueId} ${dataModel.status}"
        Set<String> readUsernames = []
        Set<String> administrationUsernames = []
        MutableAcl acl = (MutableAcl)aclUtilService.readAcl(DataModel, dataModel.id)
        if(acl.entries) {
            for ( int i = 0; i < acl.entries.size(); i++) {
                AccessControlEntry entry = acl.entries[i]
                if(entry.sid instanceof PrincipalSid) {
                    String username = ((PrincipalSid)entry.sid).principal
                    if ( entry.permission == BasePermission.READ ) {
                        if (readUsernames.contains(username)) {
                            acl.deleteAce i
                        } else {
                            readUsernames << username
                        }

                    } else if ( entry.permission == BasePermission.ADMINISTRATION ) {
                        if (administrationUsernames.contains(username)) {
                            acl.deleteAce i
                        } else {
                            administrationUsernames << username
                        }
                    }
                }
            }
        }
        aclService.updateAcl acl
    }

}
