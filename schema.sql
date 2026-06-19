-- Run this in the Supabase SQL Editor for project:
-- https://ooxyajipnzocspehufnv.supabase.co

create table if not exists packing_records (
  id         bigserial primary key,
  name       text        not null,
  saved_at   timestamptz default now(),
  orient_mode text       default 'auto',
  data       jsonb       not null
);

-- Enable Row Level Security
alter table packing_records enable row level security;

-- Allow public (anon) full access — no login required
create policy "public_all" on packing_records
  for all
  to anon
  using (true)
  with check (true);
