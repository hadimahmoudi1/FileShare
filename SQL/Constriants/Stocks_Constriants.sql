--Adds Uniqe constriants on the Stocks table.

ALTER TABLE Stocks 
  ADD CONSTRAINT uqc_Symbol
  UNIQUE (Symbol)
