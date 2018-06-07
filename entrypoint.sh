#!/bin/env bash
psql -h db --user postgres <<-SQL
  create database if not exists homicides;
  use homicides;
  grant all privileges on database homicides to postgres;
SQL

psql -h db --user postgres <<-SQL
  create table if not exists homicides
    (
      uid VARCHAR(48) PRIMARY KEY,
      reported_date INT,
      victim_last VARCHAR(256),
      victim_first VARCHAR(256),
      victim_race VARCHAR(256),
      victim_age INT,
      victim_sex VARCHAR(10),
      city VARCHAR(256),
      state VARCHAR(2),
      lat DECIMAL,
      lon DECIMAL,
      disposition VARCHAR(256)      
    )
  ;

  create index city_index on homicides (city);
  create index reported_date_index on homicides (reported_date);
  create index state_index on homicides (state);
SQL

psql -h db --user postgres
