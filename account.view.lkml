view: account {
  sql_table_name: stonebridge_ft_xero.account ;;

  dimension: account_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.account_id ;;
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

  dimension: bank_account_number {
    type: string
    sql: ${TABLE}.bank_account_number ;;
  }

  dimension: bank_account_type {
    type: string
    sql: ${TABLE}.bank_account_type ;;
  }

  dimension: class {
    type: string
    sql: ${TABLE}.class ;;
  }

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: currency_code {
    type: string
    sql: ${TABLE}.currency_code ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: enable_payments_to_account {
    type: yesno
    sql: ${TABLE}.enable_payments_to_account ;;
  }

  dimension: has_attachments {
    type: yesno
    sql: ${TABLE}.has_attachments ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: reporting_code {
    type: string
    sql: ${TABLE}.reporting_code ;;
  }

  dimension: reporting_code_name {
    type: string
    sql: ${TABLE}.reporting_code_name ;;
  }

  dimension: show_in_expense_claims {
    type: yesno
    sql: ${TABLE}.show_in_expense_claims ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: system_account {
    type: string
    sql: ${TABLE}.system_account ;;
  }

  dimension: tax_type {
    type: string
    sql: ${TABLE}.tax_type ;;
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

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      account_id,
      reporting_code_name,
      name,
      journal_line.count,
      payment.count,
      manual_journal_line.count,
      bank_account.count
    ]
  }
}
