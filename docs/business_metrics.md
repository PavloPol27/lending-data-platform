# KPIs

## KPI #1

For the performance monitoring in the Consumer Installment Loan Platform bank typically asks a question: "How much money did we expect to earn and how much did we actually earn?"

So the first metric defines a collection rate of the installments for a specific day.

**Name:** `collection_rate`.

**Grain:** `loan_id` + `as_of_date`.

**Definition:** Ratio of total collected amount to total expected installment for installments due on a specific date.

**Formula:**

`collection_rate` =  SUM(payment_amount) / SUM(expected_total_amount)

Filtered on: due_date = given date

**If no expected installments:** NULL

## KPI #2

**DPD** - how many days has passed after installment due date, if the installment was not entirely payed.

**Name:** `days_past_due` (DPD).

**Grain:** `loan_id` + `as_of_date` (loan day).

**Definition:** Maximum number of days since `due_date` among installments that are not fully paid as of `as_of_date`.

**Formula:**

1. For each installment per loan:
    - if `paid_to_date < expected_total_amount` and `as_of_date > due_date`:
        `dpd = as_of_date - due_date`
    - else:
        `dpd = 0`
2. On the loan-day level:
    `days_past_due = MAX(dpd)` for all installments loans.
