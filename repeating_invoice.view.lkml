view: repeating_invoice {
  sql_table_name: stonebridge_ft_xero.repeating_invoice ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
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

  dimension: currency_code {
    type: string
    sql: ${TABLE}.currency_code ;;
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

  dimension: repeating_invoice_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.repeating_invoice_id ;;
  }

  dimension: schedule_due_date {
    type: number
    sql: ${TABLE}.schedule_due_date ;;
  }

  dimension: schedule_due_date_type {
    type: string
    sql: ${TABLE}.schedule_due_date_type ;;
  }

  dimension_group: schedule_end {
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
    sql: ${TABLE}.schedule_end_date ;;
  }

  dimension_group: schedule_next_scheduled {
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
    sql: ${TABLE}.schedule_next_scheduled_date ;;
  }

  dimension: schedule_period {
    type: number
    sql: ${TABLE}.schedule_period ;;
  }

  dimension_group: schedule_start {
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
    sql: ${TABLE}.schedule_start_date ;;
  }

  dimension: schedule_unit {
    type: string
    sql: ${TABLE}.schedule_unit ;;
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

  dimension: total_discount {
    type: number
    sql: ${TABLE}.total_discount ;;
  }

  dimension: total_tax {
    type: number
    sql: ${TABLE}.total_tax ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      repeating_invoice.id,
      contact.skype_user_name,
      contact.contact_id,
      contact.first_name,
      contact.batch_payments_bank_account_name,
      contact.last_name,
      contact.name,
      branding_theme.branding_theme_id,
      branding_theme.name,
      repeating_invoice_line_item_has_tracking_category.count,
      repeating_invoice.count,
      repeating_invoice_line_item.count
    ]
  }
}
