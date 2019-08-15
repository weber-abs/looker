view: tracking_category_has_option {
  sql_table_name: stonebridge_ft_xero.tracking_category_has_option ;;

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

  dimension: tracking_category_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.tracking_category_id ;;
  }

  dimension: tracking_option_id {
    type: string
    sql: ${TABLE}.tracking_option_id ;;
  }

  measure: count {
    type: count
    drill_fields: [tracking_category.name, tracking_category.tracking_category_id]
  }
}
