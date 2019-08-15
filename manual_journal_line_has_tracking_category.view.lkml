view: manual_journal_line_has_tracking_category {
  sql_table_name: stonebridge_ft_xero.manual_journal_line_has_tracking_category ;;

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

  dimension: manual_journal_line_id {
    type: string
    sql: ${TABLE}.manual_journal_line_id ;;
  }

  dimension: tracking_category_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.tracking_category_id ;;
  }

  measure: count {
    type: count
    drill_fields: [tracking_category.name, tracking_category.tracking_category_id]
  }
}
