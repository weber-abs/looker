view: repeating_invoice_line_item {
  sql_table_name: stonebridge_ft_xero.repeating_invoice_line_item ;;

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

  dimension: account_code {
    type: string
    sql: ${TABLE}.account_code ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: discount_entered_as_percent {
    type: yesno
    sql: ${TABLE}.discount_entered_as_percent ;;
  }

  dimension: discount_rate {
    type: number
    sql: ${TABLE}.discount_rate ;;
  }

  dimension: item_code {
    type: string
    sql: ${TABLE}.item_code ;;
  }

  dimension: line_amount {
    type: number
    sql: ${TABLE}.line_amount ;;
  }

  dimension: line_item_id {
    type: string
    sql: ${TABLE}.line_item_id ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: repeating_invoice_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.repeating_invoice_id ;;
  }

  dimension: tax_amount {
    type: number
    sql: ${TABLE}.tax_amount ;;
  }

  dimension: tax_type {
    type: string
    sql: ${TABLE}.tax_type ;;
  }

  dimension: unit_amount {
    type: number
    sql: ${TABLE}.unit_amount ;;
  }

  dimension: validation_errors {
    type: string
    sql: ${TABLE}.validation_errors ;;
  }

  measure: count {
    type: count
    drill_fields: [repeating_invoice.id]
  }
}
