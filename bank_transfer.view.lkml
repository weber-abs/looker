view: bank_transfer {
  sql_table_name: stonebridge_ft_xero.bank_transfer ;;

  dimension: bank_transfer_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.bank_transfer_id ;;
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

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension_group: created_date_utc {
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
    sql: ${TABLE}.created_date_utc ;;
  }

  dimension_group: created_date_utcstring {
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
    sql: ${TABLE}.created_date_utcstring ;;
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

  dimension: from_bank_account_id {
    type: string
    sql: ${TABLE}.from_bank_account_id ;;
  }

  dimension: from_bank_transaction_id {
    type: string
    sql: ${TABLE}.from_bank_transaction_id ;;
  }

  dimension: has_attachments {
    type: yesno
    sql: ${TABLE}.has_attachments ;;
  }

  dimension: to_bank_account_id {
    type: string
    sql: ${TABLE}.to_bank_account_id ;;
  }

  dimension: to_bank_transaction_id {
    type: string
    sql: ${TABLE}.to_bank_transaction_id ;;
  }

  measure: count {
    type: count
    drill_fields: [bank_transfer_id]
  }
}
