view: invoice {
  sql_table_name: stonebridge_ft_xero.invoice ;;

  dimension: invoice_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.invoice_id ;;
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

  dimension: amount_credited {
    type: number
    sql: ${TABLE}.amount_credited ;;
  }

  dimension: amount_due {
    type: number
    sql: ${TABLE}.amount_due ;;
  }

  dimension: amount_paid {
    type: number
    value_format_name: id
    sql: ${TABLE}.amount_paid ;;
  }

  dimension: branding_theme_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.branding_theme_id ;;
  }

  dimension: cisdeduction {
    type: number
    sql: ${TABLE}.cisdeduction ;;
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

  dimension_group: due {
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
    sql: ${TABLE}.due_date ;;
  }

  dimension_group: expected_payment {
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
    sql: ${TABLE}.expected_payment_date ;;
  }

  dimension_group: fully_paid_on {
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
    sql: ${TABLE}.fully_paid_on_date ;;
  }

  dimension: has_attachments {
    type: yesno
    sql: ${TABLE}.has_attachments ;;
  }

  dimension: has_errors {
    type: yesno
    sql: ${TABLE}.has_errors ;;
  }

  dimension: invoice_number {
    type: string
    sql: ${TABLE}.invoice_number ;;
  }

  dimension: is_discounted {
    type: yesno
    sql: ${TABLE}.is_discounted ;;
  }

  dimension: line_amount_types {
    type: string
    sql: ${TABLE}.line_amount_types ;;
  }

  dimension_group: planned_payment {
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
    sql: ${TABLE}.planned_payment_date ;;
  }

  dimension: reference {
    type: string
    sql: ${TABLE}.reference ;;
  }

  dimension: sent_to_contact {
    type: yesno
    sql: ${TABLE}.sent_to_contact ;;
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

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      invoice_id,
      contact.skype_user_name,
      contact.contact_id,
      contact.first_name,
      contact.batch_payments_bank_account_name,
      contact.last_name,
      contact.name,
      branding_theme.branding_theme_id,
      branding_theme.name,
      payment.count,
      allocation.count,
      invoice_line_item.count
    ]
  }
}
