view: journal {
  sql_table_name: stonebridge_ft_xero.journal ;;

  dimension: journal_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.journal_id ;;
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

  dimension_group: journal {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      month_name,
      quarter,
      year
    ]
    sql: ${TABLE}.journal_date ;;
  }

  dimension: journal_number {
    type: number
    sql: ${TABLE}.journal_number ;;
  }

  dimension: reference {
    type: string
    sql: ${TABLE}.reference ;;
  }

  dimension: source_id {
    type: string
    sql: ${TABLE}.source_id ;;
  }

  dimension: source_type {
    type: string
    sql: ${TABLE}.source_type ;;
  }

  dimension: reporting_period_mtd {
    description: "This Month versus Last Month "
    group_label: "Journal Date"
    sql: CASE
        WHEN EXTRACT(YEAR FROM ${journal_raw}) = EXTRACT( YEAR FROM CURRENT_DATE())
        AND EXTRACT(MONTH FROM ${journal_raw}) = EXTRACT( MONTH FROM CURRENT_DATE())
        AND ${journal_raw} <= CURRENT_DATE()
        THEN 'This Month'

        WHEN EXTRACT(YEAR FROM ${journal_raw}) = EXTRACT( YEAR FROM CURRENT_DATE())
        AND EXTRACT(MONTH FROM ${journal_raw}) + 1 = EXTRACT(MONTH FROM CURRENT_DATE())
        THEN 'Last Month'
        ELSE NULL


      END
       ;;
  }

  measure: count {
    type: count
    drill_fields: [journal_id, journal_line.count, journal_line_has_tracking_category.count]
  }
}
