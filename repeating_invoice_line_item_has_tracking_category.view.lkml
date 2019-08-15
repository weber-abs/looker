view: repeating_invoice_line_item_has_tracking_category {
  sql_table_name: stonebridge_ft_xero.repeating_invoice_line_item_has_tracking_category ;;

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

  dimension: line_item_id {
    type: string
    sql: ${TABLE}.line_item_id ;;
  }

  dimension: repeating_invoice_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.repeating_invoice_id ;;
  }

  dimension: tracking_category_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.tracking_category_id ;;
  }

  measure: count {
    type: count
    drill_fields: [repeating_invoice.id, tracking_category.name, tracking_category.tracking_category_id]
  }
}
