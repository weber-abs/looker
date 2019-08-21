view: bank_transaction {
  sql_table_name: stonebridge_ft_xero.bank_transaction ;;

  dimension: bank_transaction_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.bank_transaction_id ;;
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

  dimension: bank_account_id {
    type: string
    sql: ${TABLE}.bank_account_id ;;
  }

  dimension: contact_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.contact_id ;;
  }

  dimension: currency_code {
    type: string
    sql: ${TABLE}.currency_code ;;
  }

  dimension: currency_rate {
    type: number
    sql: ${TABLE}.currency_rate ;;
  }

  dimension_group: date {
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
    sql: ${TABLE}.date ;;
  }

  dimension: external_link_provider_name {
    type: string
    sql: ${TABLE}.external_link_provider_name ;;
  }

  dimension: has_attachments {
    type: yesno
    sql: ${TABLE}.has_attachments ;;
  }

  dimension: is_reconciled {
    type: yesno
    sql: ${TABLE}.is_reconciled ;;
  }

  dimension: line_amount_types {
    type: string
    sql: ${TABLE}.line_amount_types ;;
  }

  dimension: overpayment_id {
    type: string
    sql: ${TABLE}.overpayment_id ;;
  }

  dimension: prepayment_id {
    type: string
    sql: ${TABLE}.prepayment_id ;;
  }

  dimension: reference {
    type: string
    sql: ${TABLE}.reference ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: sub_total {
    type: number
    sql: ${TABLE}.sub_total ;;
  }

  dimension: total {
    type: number
    sql: ${TABLE}.total ;;
  }

  dimension: total_tax {
    type: number
    sql: ${TABLE}.total_tax ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension_group: updated_date_utc {
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
    sql: ${TABLE}.updated_date_utc ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: cash_flow {
    type: sum
    value_format: "$#,##0.00"
    sql: ${sub_total} ;;
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      bank_transaction_id,
      external_link_provider_name,
      contact.skype_user_name,
      contact.contact_id,
      contact.first_name,
      contact.batch_payments_bank_account_name,
      contact.last_name,
      contact.name,
      bank_transaction_line_item_has_tracking_category.count,
      bank_transaction_line_items.count
    ]
  }
}
