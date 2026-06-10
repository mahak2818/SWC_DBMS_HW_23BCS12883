SELECT COUNT(*) AS payment_count
FROM transactions t
WHERE EXISTS (
    SELECT 1
    FROM transactions t2
    WHERE t2.merchant_id = t.merchant_id
      AND t2.credit_card_id = t.credit_card_id
      AND t2.amount = t.amount
      AND t2.transaction_timestamp < t.transaction_timestamp
      AND t.transaction_timestamp - t2.transaction_timestamp <= INTERVAL '10 minutes'
);
