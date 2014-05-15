
; This is a working makefile - try it! Any line starting with a `;` is a comment.
  
; Core version
; ------------
; Each makefile should begin by declaring the core version of Drupal that all
; projects should be compatible with.
  
core = 7.x
  
; API version
; ------------
; Every makefile needs to declare its Drush Make API version. This version of
; drush make uses API version `2`.
  
api = 2
  
; Core project
; ------------
; In order for your makefile to generate a full Drupal site, you must include
; a core project. This is usually Drupal core, but you can also specify
; alternative core projects like Pressflow. Note that makefiles included with
; install profiles *should not* include a core project.
  
; Drupal 7.x. Requires the `core` property to be set to 7.x.
projects[drupal][version] = 7
  
; Modules
; --------
projects[admin][type] = "module"
projects[admin][subdir] = "contrib"
projects[admin_menu][type] = "module"
projects[admin_menu][subdir] = "contrib"
projects[admin_theme][type] = "module"
projects[admin_theme][subdir] = "contrib"
projects[backup_migrate][type] = "module"
projects[backup_migrate][subdir] = "contrib"
projects[ctools][type] = "module"
projects[ctools][subdir] = "contrib"
projects[context][type] = "module"
projects[context][subdir] = "contrib"
projects[calendar][type] = "module"
projects[calendar][subdir] = "contrib"
projects[date][type] = "module"
projects[date][subdir] = "contrib"
projects[devel][type] = "module"
projects[devel][subdir] = "contrib"
projects[diff][type] = "module"
projects[diff][subdir] = "contrib"
projects[elysia_cron][type] = "module"
projects[elysia_cron][subdir] = "contrib"
projects[entity][type] = "module"
projects[entity][subdir] = "contrib"
projects[entityreference][type] = "module"
projects[entityreference][subdir] = "contrib"
projects[features][type] = "module"
projects[features][subdir] = "contrib"
projects[field_group][type] = "module"
projects[field_group][subdir] = "contrib"
projects[fivestar][type] = "module"
projects[fivestar][subdir] = "contrib"
projects[google_analytics][type] = "module"
projects[google_analytics][subdir] = "contrib"
projects[jquery_update][type] = "module"
projects[jquery_update][subdir] = "contrib"
projects[imce][type] = "module"
projects[imce][subdir] = "contrib"
projects[imce_wysiwyg][type] = "module"
projects[imce_wysiwyg][subdir] = "contrib"
projects[i18n][type] = "module"
projects[i18n][subdir] = "contrib"
projects[l10n_update][type] = "module"
projects[l10n_update][subdir] = "contrib"
projects[libraries][type] = "module"
projects[libraries][subdir] = "contrib"
projects[link][type] = "module"
projects[link][subdir] = "contrib"
projects[nodequeue][type] = "module"
projects[nodequeue][subdir] = "contrib"
projects[pathauto][type] = "module"
projects[pathauto][subdir] = "contrib"
projects[panels][type] = "module"
projects[panels][subdir] = "contrib"
projects[strongarm][type] = "module"
projects[strongarm][subdir] = "contrib"
projects[token][type] = "module"
projects[token][subdir] = "contrib"
projects[variable][type] = "module"
projects[variable][subdir] = "contrib"
projects[views][type] = "module"
projects[views][subdir] = "contrib"
projects[votingapi][type] = "module"
projects[votingapi][subdir] = "contrib"
projects[wysiwyg][type] = "module"
projects[wysiwyg][subdir] = "contrib"

  

; Themes
; --------

  
  
; Libraries
; ---------
; No libraries were included


