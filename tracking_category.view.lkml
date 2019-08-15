view: tracking_category {
  sql_table_name: stonebridge_ft_xero.tracking_category ;;

  dimension: tracking_category_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.tracking_category_id ;;
  }

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

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      tracking_category_id,
      name,
      tracking_category_has_option.count,
      manual_journal_line_has_tracking_category.count,
      repeating_invoice_line_item_has_tracking_category.count,
      journal_line_has_tracking_category.count,
      bank_transaction_line_item_has_tracking_category.count,
      invoice_line_item_has_tracking_category.count
    ]
  }
}
