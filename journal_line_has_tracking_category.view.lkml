view: journal_line_has_tracking_category {
  sql_table_name: stonebridge_ft_xero.journal_line_has_tracking_category ;;

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

  dimension: journal_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.journal_id ;;
  }

  dimension: journal_line_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.journal_line_id ;;
  }

  dimension: tracking_category_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.tracking_category_id ;;
  }

  dimension: tracking_category_option_id {
    type: string
    sql: ${TABLE}.tracking_category_option_id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      journal.journal_id,
      journal_line.tax_name,
      journal_line.journal_line_id,
      journal_line.account_name,
      tracking_category.name,
      tracking_category.tracking_category_id
    ]
  }
}
