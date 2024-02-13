SELECT DISTINCT bidders.name FROM bidders
JOIN bids ON bidder_id = bidders.id;

SELECT bidders.name FROM bidders
WHERE EXISTS (SELECT 1 FROM bids WHERE bidder_id = bidders.id);