view: credit_note {
  sql_table_name: stonebridge_ft_xero.credit_note ;;

  dimension: credit_note_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.credit_note_id ;;
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

  dimension: applied_amount {
    type: number
    sql: ${TABLE}.applied_amount ;;
  }

  dimension: branding_theme_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.branding_theme_id ;;
  }

  dimension: contact_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.contact_id ;;
  }

  dimension: credit_note_number {
    type: string
    sql: ${TABLE}.credit_note_number ;;
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

  dimension: line_amount_types {
    type: string
    sql: ${TABLE}.line_amount_types ;;
  }

  dimension: reference {
    type: string
    sql: ${TABLE}.reference ;;
  }

  dimension: remaining_credit {
    type: number
    sql: ${TABLE}.remaining_credit ;;
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

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      credit_note_id,
      contact.skype_user_name,
      contact.contact_id,
      contact.first_name,
      contact.batch_payments_bank_account_name,
      contact.last_name,
      contact.name,
      branding_theme.branding_theme_id,
      branding_theme.name,
      payment.count,
      credit_note_line_item.count,
      allocation.count
    ]
  }
}
