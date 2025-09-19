######################################################
## Masked ArchivesSpace configuration for Archives at NCBS ##
######################################################


## SYSTEM

AppConfig[:db_url] = "jdbc:mysql://localhost:3306/<you-aspace-db>?user=<your-aspace-db>&password=<your-aspace-db-user>&useUnicode=true&characterEncoding=UTF-8"
AppConfig[:db_max_connections] = proc { 20 + (AppConfig[:indexer_thread_count] * 2) }
AppConfig[:db_pool_timeout] = 5 # number of seconds to wait before raising a PoolTimeout error
AppConfig[:force_ssl] = false
AppConfig[:data_directory] = File.join(Dir.home, "<relative-path-to-data-directory>")
AppConfig[:backup_directory] = proc { File.join(AppConfig[:data_directory], "db_backups") }
AppConfig[:backend_url] = "http://localhost:8089"
AppConfig[:frontend_url] = "http://localhost:8080"
AppConfig[:public_url] = "http://localhost:8081"
AppConfig[:oai_url] = "http://localhost:8082"
AppConfig[:solr_url] = "http://localhost:8983/solr/archivesspace"
AppConfig[:indexer_url] = "http://localhost:8091"
AppConfig[:docs_url] = "http://localhost:8888"
AppConfig[:frontend_proxy_url] = "https://staff.catalogue.archives.ncbs.res.in"
AppConfig[:public_proxy_url] = "https://catalogue.archives.ncbs.res.in"
AppConfig[:oai_proxy_url] = "https://oai.catalogue.archives.ncbs.res.in/"
AppConfig[:backend_instance_urls] = proc { [AppConfig[:backend_url]] }
AppConfig[:frontend_proxy_prefix] = proc { "#{URI(AppConfig[:frontend_proxy_url]).path}/".gsub(%r{/+$}, "/") }
AppConfig[:public_proxy_prefix] = proc { "#{URI(AppConfig[:public_proxy_url]).path}/".gsub(%r{/+$}, "/") }
AppConfig[:jetty_response_buffer_size_bytes] = 64 * 1024
AppConfig[:jetty_request_buffer_size_bytes] = 64 * 1024
AppConfig[:use_jetty_shutdown_handler] = false
AppConfig[:jetty_shutdown_path] = "/xkcd"
AppConfig[:oai_ead_options] = {:include_daos => true, :use_numbered_c_tags => true, :include_uris => true}
AppConfig[:cookie_prefix] = "archivesspace"
AppConfig[:export_eac_agency_code] = false

## LOG
AppConfig[:frontend_log] = "<absolute-path-to-.out-file>"
AppConfig[:frontend_log_level] = "error"
AppConfig[:backend_log] = "<absolute-path-to-.out-file>"
AppConfig[:backend_log_level] = "error"
AppConfig[:pui_log] = "<absolute-path-to-.out-file>"
AppConfig[:pui_log_level] = "error"
AppConfig[:indexer_log] = "<absolute-path-to-.out-file>"
AppConfig[:indexer_log_level] = "error"
AppConfig[:db_debug_log] = false
AppConfig[:mysql_binlog] = false

## SOLR
AppConfig[:solr_params] = { 'q.op' => 'AND' }
AppConfig[:solr_verify_checksums] = true
AppConfig[:solr_indexing_frequency_seconds] = 30
AppConfig[:solr_facet_limit] = 100
AppConfig[:default_page_size] = 10
AppConfig[:max_boolean_queries] = 1024 # ArchivesSpace Solr default
AppConfig[:max_page_size] = 250

## PLUGINS
AppConfig[:plugins_directory] = "plugins"
AppConfig[:plugins] = ['local', 'lcnaf']

## SEARCH
AppConfig[:limit_csv_fields] = true
AppConfig[:max_search_columns] = 7

#INDEXER CONFIGS
AppConfig[:indexer_records_per_thread] = 25
AppConfig[:indexer_thread_count] = 4
AppConfig[:indexer_solr_timeout_seconds] = 300
AppConfig[:pui_indexer_enabled] = true
AppConfig[:pui_indexing_frequency_seconds] = 30
AppConfig[:pui_indexer_records_per_thread] = 25
AppConfig[:pui_indexer_thread_count] = 2
AppConfig[:index_state_class] = 'IndexState'
AppConfig[:allow_other_unmapped] = false

### DATABASE
AppConfig[:db_url_redacted] = proc { AppConfig[:db_url].gsub(/(user|password)=(.*?)(&|$)/, '\1=[REDACTED]\3') }
AppConfig[:demo_db_backup_schedule] = "0 4 * * *"
AppConfig[:allow_unsupported_database] = false
AppConfig[:allow_non_utf8_mysql_database] = false
AppConfig[:demo_db_backup_number_to_keep] = 7
AppConfig[:demodb_snapshot_flag] = proc { File.join(AppConfig[:data_directory], "create_demodb_snapshot.txt") }
AppConfig[:shared_storage] = proc { File.join(AppConfig[:data_directory], "shared") }

### MAIN CONFIG

AppConfig[:path_to_java] = "java"
AppConfig[:locale] = :en
AppConfig[:frontend_theme] = "ancbs"
AppConfig[:public_theme] = "ancbs"
AppConfig[:pui_search_results_page_size] = 100
AppConfig[:pui_branding_img] = 'logotype_ancbs.svg'
AppConfig[:pui_branding_img_alt_text] = 'Archives at NCBS'
AppConfig[:pui_show_favicon] = true
AppConfig[:frontend_branding_img] = 'ancbs/logotype_ancbs.svg'
AppConfig[:frontend_branding_img_alt_text] = 'Archives at NCBS'
AppConfig[:frontend_show_favicon] = true
AppConfig[:enable_backend] = true
AppConfig[:enable_frontend] = true
AppConfig[:enable_public] = true
AppConfig[:enable_indexer] = true
AppConfig[:enable_docs] = true
AppConfig[:enable_oai] = true
AppConfig[:allow_password_reset] = true
AppConfig[:allow_other_admins_access_to_system_info] = false
AppConfig[:default_admin_password] = "<admin-password>"
AppConfig[:ignore_schema_info_check] = false
AppConfig[:disable_config_changed_warning] = false
AppConfig[:demo_data_url] = ""
AppConfig[:show_external_ids] = false
AppConfig[:display_identifiers_in_largetree_container] = false
AppConfig[:allow_mixed_content_title_fields] = false
AppConfig[:bulk_archival_object_updater_apply_deletes] = false
AppConfig[:bulk_archival_object_updater_create_missing_top_containers] = false
AppConfig[:hide_do_load] = false
AppConfig[:help_enabled] = true
AppConfig[:help_url] = "https://archivesspace.atlassian.net/wiki/spaces/ArchivesSpaceUserManual/overview"
AppConfig[:help_topic_base_url] = "https://archivesspace.atlassian.net/wiki/spaces/ArchivesSpaceUserManual/pages/"
AppConfig[:feedback_url] = "https://archivesspace.org/contact"
AppConfig[:max_linked_events_to_resolve] = 100
AppConfig[:use_human_readable_urls] = false
AppConfig[:repo_name_in_slugs] = false
AppConfig[:auto_generate_slugs_with_id] = false
AppConfig[:generate_resource_slugs_with_eadid] = false
AppConfig[:generate_archival_object_slugs_with_cuid] = false
AppConfig[:include_pui_finding_aid_urls_in_marc_exports] = false
AppConfig[:use_slug_finding_aid_urls_in_marc_exports] = false
AppConfig[:sort_accession_date_filter_asc] = false
AppConfig[:show_source_in_subject_listing] = true
AppConfig[:abstract_note_length] = 500
AppConfig[:max_location_range] = 1000

# REPORT
AppConfig[:report_page_layout] = "A4"
AppConfig[:report_pdf_font_paths] = proc { ["#{AppConfig[:backend_url]}/reports/static/fonts/dejavu/DejaVuSans.ttf"] }
AppConfig[:report_pdf_font_family] = "\"DejaVu Sans\", sans-serif"
AppConfig[:enable_custom_reports] = false

#JOBS
AppConfig[:job_file_path] = proc { AppConfig.has_key?(:import_job_path) ? AppConfig[:import_job_path] : File.join(AppConfig[:shared_storage], "job_files") }
AppConfig[:job_poll_seconds] = proc { AppConfig.has_key?(:import_poll_seconds) ? AppConfig[:import_poll_seconds] : 5 }
AppConfig[:job_timeout_seconds] = proc { AppConfig.has_key?(:import_timeout_seconds) ? AppConfig[:import_timeout_seconds] : 300 }
AppConfig[:jobs_cancelable] = proc { (AppConfig[:db_url] != AppConfig.demo_db_url).to_s }
AppConfig[:job_thread_count] = 2

## PUI
AppConfig[:allow_pui_language_selection] = false
AppConfig[:pui_repositories_sort] = :display_string
AppConfig[:pui_pdf_font_files] = ["KurintoText-Rg.ttf",
                                  "KurintoText-Bd.ttf",
                                  "KurintoText-It.ttf",
                                  "KurintoTextJP-Rg.ttf",
                                  "KurintoTextJP-Bd.ttf",
                                  "KurintoTextJP-It.ttf",
                                  "KurintoTextKR-Rg.ttf",
                                  "KurintoTextKR-Bd.ttf",
                                  "KurintoTextKR-It.ttf",
                                  "KurintoTextSC-Rg.ttf",
                                  "KurintoTextSC-Bd.ttf",
                                  "KurintoTextSC-It.ttf",
                                  "NotoSerif-Regular.ttf",
                                  "NotoSerif-Bold.ttf",
                                  "NotoSerif-Italic.ttf"]
AppConfig[:pui_pdf_font_name] = "Kurinto Text,Kurinto Text JP,Kurinto Text KR,Kurinto Text SC,Noto Serif"
AppConfig[:pui_pdf_paragraph_line_height] = "125%"
AppConfig[:pui_pdf_title_line_height] = "140%"
AppConfig[:pui_max_concurrent_pdfs] = 2
AppConfig[:pui_pdf_timeout] = 600
AppConfig[:record_inheritance] = {
  :archival_object => {
    :inherited_fields => [
                          {
                            :property => 'title',
                            :inherit_directly => true
                          },
                          {
                            :property => 'component_id',
                            :inherit_directly => false
                          },
                          {
                            :property => 'lang_materials',
                            :inherit_directly => false
                          },
                          {
                            :property => 'dates',
                            :inherit_directly => true
                          },
                          {
                            :property => 'extents',
                            :inherit_directly => false
                          },
                          {
                            :property => 'linked_agents',
                            :inherit_if => proc {|json| json.select {|j| j['role'] == 'creator'} },
                            :inherit_directly => false
                          },
                          {
                            :property => 'notes',
                            :inherit_if => proc {|json| json.select {|j| j['type'] == 'accessrestrict'} },
                            :inherit_directly => true
                          },
                          {
                            :property => 'notes',
                            :inherit_if => proc {|json| json.select {|j| j['type'] == 'userestrict'} },
                            :inherit_directly => true
                          },
                          {
                            :property => 'notes',
                            :inherit_if => proc {|json| json.select {|j| j['type'] == 'scopecontent'} },
                            :inherit_directly => false
                          },
                          {
                            :property => 'notes',
                            :inherit_if => proc {|json| json.select {|j| j['type'] == 'langmaterial'} },
                            :inherit_directly => false
                          },
                         ]
  }
}
AppConfig[:record_inheritance_resolves] = [
  'ancestors',
  'ancestors::linked_agents',
  'ancestors::subjects',
  # 'ancestors::instances::sub_container::top_container',
]
AppConfig[:pui_block_referrer] = true
AppConfig[:pui_hide] = {}
AppConfig[:pui_hide][:repositories] = false
AppConfig[:pui_hide][:resources] = false
AppConfig[:pui_hide][:digital_objects] = false
AppConfig[:pui_hide][:accessions] = false
AppConfig[:pui_hide][:subjects] = false
AppConfig[:pui_hide][:agents] = false
AppConfig[:pui_hide][:classifications] = false
AppConfig[:pui_hide][:search_tab] = false
AppConfig[:pui_hide][:resource_badge] = false
AppConfig[:pui_hide][:record_badge] = true # hide by default
AppConfig[:pui_hide][:digital_object_badge] = false
AppConfig[:pui_hide][:accession_badge] = false
AppConfig[:pui_hide][:subject_badge] = false
AppConfig[:pui_hide][:agent_badge] = false
AppConfig[:pui_hide][:classification_badge] = false
AppConfig[:pui_hide][:counts] = false
AppConfig[:pui_hide][:container_inventory] = false
AppConfig[:pui_display_deaccessions] = true
AppConfig[:pui_collection_org_sidebar_position] = 'left'
AppConfig[:pui_display_identifiers_in_resource_tree] = false
AppConfig[:pui_readmore_max_characters] = 1000
AppConfig[:pui_expand_all] = true
AppConfig[:pui_search_collection_from_archival_objects] = false
AppConfig[:pui_search_collection_from_collection_organization] = false
AppConfig[:pui_enable_staff_link] = true
AppConfig[:pui_staff_link_mode] = 'edit'
AppConfig[:pui_requests_permitted_for_types] = [:archival_object]
AppConfig[:pui_requests_permitted_for_containers_only] = false
AppConfig[:pui_repos] = {}
AppConfig[:pui_email_enabled] = false
AppConfig[:pui_request_use_repo_email] = false
AppConfig[:pui_display_facets_alpha] = false
AppConfig[:pui_page_actions_cite] = true
AppConfig[:pui_page_actions_request] = false
AppConfig[:pui_page_actions_print] = true

## CUSTOM ACTIONS
AppConfig[:pui_page_custom_actions] << {
  'record_type' => ['resource', 'archival_object'],
  'label' => 'Access Guidelines',
  'icon' => 'fa-hand-o-up',
  'url_proc' => proc {'https://archives.ncbs.res.in/access'},
}
AppConfig[:pui_page_custom_actions] << {
  'record_type' => [ 'archival_object'],
  'label' => 'Takedown',
  'icon' => 'fa-eraser',
  'url_proc' => proc {'https://archives.ncbs.res.in/takedown'},
}
AppConfig[:pui_page_custom_actions] << {
  'record_type' => [ 'resource'],
  'label' => 'EAD',
  'icon' => 'fa-file-code-o',
  'url_proc' => proc {|record| 'https://oai.catalogue.archives.ncbs.res.in/oai?verb=GetRecord&identifier=oai:archives.ncbs.res.in:'+record.uri+'&metadataPrefix=oai_ead'}
}
AppConfig[:pui_page_custom_actions] << {
  'record_type' => [ 'resource','archival_object'],
  'label' => 'Dublin Core',
  'icon' => 'fa-file-code-o',
  'url_proc' => proc {|record| 'https://oai.catalogue.archives.ncbs.res.in/oai?verb=GetRecord&identifier=oai:archives.ncbs.res.in:'+record.uri+'&metadataPrefix=oai_dc'}
}

## EMAIL
AppConfig[:global_email_from_address] = "archives@some.org"
AppConfig[:email_perform_deliveries] = true
AppConfig[:email_raise_delivery_errors] = true
AppConfig[:email_delivery_method] = :smtp
AppConfig[:email_smtp_settings] = {
  address:              'smtp.some.org',
      port:                 587,
      domain:               'some.org',
      user_name:            'archivist',
      password:             'archivist-pass',
      authentication:       'plain',
      enable_starttls_auto: true,
}
AppConfig[:email_perform_deliveries] = true
AppConfig[:email_raise_delivery_errors] = true

## ARK

AppConfig[:arks_enabled] = false
AppConfig[:ark_naan] = "42412"
AppConfig[:ark_url_prefix] = proc { AppConfig[:public_proxy_url] }
AppConfig[:ark_minter] = :archivesspace_ark_minter
AppConfig[:ark_enable_repository_shoulder] = false
AppConfig[:ark_shoulder_delimiter] = ''
AppConfig[:arks_allow_external_arks] = true
AppConfig[:prune_ark_name_table] = false
