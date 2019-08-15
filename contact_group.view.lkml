view: contact_group {
  sql_table_name: stonebridge_ft_xero.contact_group ;;

  dimension: contact_group_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.contact_group_id ;;
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

  dimension: has_validation_errors {
    type: yesno
    sql: ${TABLE}.has_validation_errors ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  measure: count {
    type: count
    drill_fields: [contact_group_id, name, contact_group_member.count]
  }
}
