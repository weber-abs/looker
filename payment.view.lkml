view: payment {
  sql_table_name: stonebridge_ft_xero.payment ;;

  dimension: prepayment_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.prepayment_id ;;
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

  dimension: account_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.account_id ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: bank_amount {
    type: number
    sql: ${TABLE}.bank_amount ;;
  }

  dimension: batch_payment_id {
    type: string
    sql: ${TABLE}.batch_payment_id ;;
  }

  dimension: credit_note_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.credit_note_id ;;
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

  dimension: expense_claim_id {
    type: string
    sql: ${TABLE}.expense_claim_id ;;
  }

  dimension: has_account {
    type: yesno
    sql: ${TABLE}.has_account ;;
  }

  dimension: has_validation_errors {
    type: yesno
    sql: ${TABLE}.has_validation_errors ;;
  }

  dimension: invoice_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.invoice_id ;;
  }

  dimension: is_reconciled {
    type: yesno
    sql: ${TABLE}.is_reconciled ;;
  }

  dimension: overpayment_id {
    type: string
    sql: ${TABLE}.overpayment_id ;;
  }

  dimension: payment_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.payment_id ;;
  }

  dimension: payment_type {
    type: string
    sql: ${TABLE}.payment_type ;;
  }

  dimension: reference {
    type: string
    sql: ${TABLE}.reference ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
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
      prepayment_id,
      credit_note.credit_note_id,
      account.account_id,
      account.reporting_code_name,
      account.name,
      payment.prepayment_id,
      invoice.invoice_id,
      payment.count
    ]
  }
}
