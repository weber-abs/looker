view: tracking_category_option {
  sql_table_name: stonebridge_ft_xero.tracking_category_option ;;

  dimension_group: _fivetran_synced {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}._fivetran_synced ;;
  }

  dimension: has_validation_errors {
    type: yesno
    sql: ${TABLE}.has_validation_errors ;;
  }

  dimension: is_active {
    type: yesno
    sql: ${TABLE}.is_active ;;
  }

  dimension: is_archived {
    type: yesno
    sql: ${TABLE}.is_archived ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: tracking_option_id {
    type: string
    sql: ${TABLE}.tracking_option_id ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
