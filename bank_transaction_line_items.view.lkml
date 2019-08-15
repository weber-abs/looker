view: bank_transaction_line_items {
  sql_table_name: stonebridge_ft_xero.bank_transaction_line_items ;;

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

  dimension: bank_transaction_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.bank_transaction_id ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
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

  measure: count {
    type: count
    drill_fields: [bank_transaction.bank_transaction_id, bank_transaction.external_link_provider_name]
  }
}
