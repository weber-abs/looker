connection: "bigquery"

# include all the views
include: "*.view"

datagroup: kpi_dashboard_poc_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: kpi_dashboard_poc_default_datagroup

explore: bank_transaction {
  label: "Transactions"

  join: account {
    type: left_outer
    sql_on: ${bank_transaction.bank_account_id} = ${account.account_id} ;;
    relationship: many_to_one
  }

  join: bank_account {
    type: left_outer
    sql_on: ${bank_account.account_id} = ${account.account_id} ;;
    relationship: many_to_one
  }

  join: bank_transaction_line_items {
    type: left_outer
    sql_on: ${bank_transaction.bank_transaction_id} = ${bank_transaction_line_items.bank_transaction_id} ;;
    relationship: one_to_many
  }

  join: bank_transaction_line_item_has_tracking_category {
    type: left_outer
    sql_on: ${bank_transaction.bank_transaction_id} = ${bank_transaction_line_item_has_tracking_category.bank_transaction_id} ;;
    relationship: many_to_one
  }

  join: journal_line {
    type: left_outer
    sql_on: ${account.account_id} = ${journal_line.account_id} ;;
    relationship: one_to_many
  }

  join: journal {
    type: inner
    sql_on: ${journal_line.journal_id} = ${journal.journal_id} ;;
    relationship: one_to_one
  }

  join: journal_line_has_tracking_category {
    type: inner
    sql_on: ${journal_line.journal_line_id} = ${journal_line_has_tracking_category.journal_line_id} ;;
    relationship: one_to_one
  }

  join: tracking_category {
    type: inner
    sql_on: ${journal_line_has_tracking_category.tracking_category_id} = ${tracking_category.tracking_category_id} ;;
    relationship: one_to_one
  }

  join: tracking_category_has_option {
    type: inner
    sql_on: ${tracking_category.tracking_category_id} = ${tracking_category_has_option.tracking_category_id} ;;
    relationship: one_to_one
  }

  join: tracking_category_option {
    type: inner
    sql_on: ${tracking_category_has_option.tracking_option_id} = ${tracking_category_option.tracking_option_id} ;;
    relationship: one_to_one

  }

}

explore: invoice {}
