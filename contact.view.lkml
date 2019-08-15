view: contact {
  sql_table_name: stonebridge_ft_xero.contact ;;

  dimension: contact_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.contact_id ;;
  }

  dimension: _fivetran_deleted {
    type: yesno
    sql: ${TABLE}._fivetran_deleted ;;
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

  dimension: account_number {
    type: string
    sql: ${TABLE}.account_number ;;
  }

  dimension: accounts_payable_tax_type {
    type: string
    sql: ${TABLE}.accounts_payable_tax_type ;;
  }

  dimension: accounts_receivable_tax_type {
    type: string
    sql: ${TABLE}.accounts_receivable_tax_type ;;
  }

  dimension: balances_accounts_payable_outstanding {
    type: number
    sql: ${TABLE}.balances_accounts_payable_outstanding ;;
  }

  dimension: balances_accounts_payable_overdue {
    type: number
    sql: ${TABLE}.balances_accounts_payable_overdue ;;
  }

  dimension: balances_accounts_receivable_outstanding {
    type: number
    sql: ${TABLE}.balances_accounts_receivable_outstanding ;;
  }

  dimension: balances_accounts_receivable_overdue {
    type: number
    sql: ${TABLE}.balances_accounts_receivable_overdue ;;
  }

  dimension: bank_account_details {
    type: string
    sql: ${TABLE}.bank_account_details ;;
  }

  dimension: batch_payments_bank_account_name {
    type: string
    sql: ${TABLE}.batch_payments_bank_account_name ;;
  }

  dimension: batch_payments_bank_account_number {
    type: string
    sql: ${TABLE}.batch_payments_bank_account_number ;;
  }

  dimension: batch_payments_code {
    type: string
    sql: ${TABLE}.batch_payments_code ;;
  }

  dimension: batch_payments_details {
    type: string
    sql: ${TABLE}.batch_payments_details ;;
  }

  dimension: batch_payments_reference {
    type: string
    sql: ${TABLE}.batch_payments_reference ;;
  }

  dimension: branding_theme_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.branding_theme_id ;;
  }

  dimension: contact_number {
    type: string
    sql: ${TABLE}.contact_number ;;
  }

  dimension: contact_status {
    type: string
    sql: ${TABLE}.contact_status ;;
  }

  dimension: default_currency {
    type: string
    sql: ${TABLE}.default_currency ;;
  }

  dimension: discount {
    type: number
    sql: ${TABLE}.discount ;;
  }

  dimension: email_address {
    type: string
    sql: ${TABLE}.email_address ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: has_attachments {
    type: yesno
    sql: ${TABLE}.has_attachments ;;
  }

  dimension: has_validation_errors {
    type: yesno
    sql: ${TABLE}.has_validation_errors ;;
  }

  dimension: is_customer {
    type: yesno
    sql: ${TABLE}.is_customer ;;
  }

  dimension: is_supplier {
    type: yesno
    sql: ${TABLE}.is_supplier ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: purchases_default_account_code {
    type: string
    sql: ${TABLE}.purchases_default_account_code ;;
  }

  dimension: sales_default_account_code {
    type: string
    sql: ${TABLE}.sales_default_account_code ;;
  }

  dimension: skype_user_name {
    type: string
    sql: ${TABLE}.skype_user_name ;;
  }

  dimension: tax_number {
    type: string
    sql: ${TABLE}.tax_number ;;
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

  dimension: website {
    type: string
    sql: ${TABLE}.website ;;
  }

  dimension: xero_network_key {
    type: string
    sql: ${TABLE}.xero_network_key ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      contact_id,
      skype_user_name,
      first_name,
      batch_payments_bank_account_name,
      last_name,
      name,
      branding_theme.branding_theme_id,
      branding_theme.name,
      bank_transaction.count,
      credit_note.count,
      repeating_invoice.count,
      contact_group_member.count,
      contact_address.count,
      invoice.count
    ]
  }
}
