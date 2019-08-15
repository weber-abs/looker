connection: "bigquery"

# include all the views
include: "*.view"

datagroup: kpi_dashboard_poc_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: kpi_dashboard_poc_default_datagroup
