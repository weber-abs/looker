view: contact_group_member {
  sql_table_name: stonebridge_ft_xero.contact_group_member ;;

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

  dimension: contact_group_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.contact_group_id ;;
  }

  dimension: contact_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.contact_id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      contact_group.name,
      contact_group.contact_group_id,
      contact.skype_user_name,
      contact.contact_id,
      contact.first_name,
      contact.batch_payments_bank_account_name,
      contact.last_name,
      contact.name
    ]
  }
}
