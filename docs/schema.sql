-- Aiman Phase 0 Database Schema
-- Run this in Supabase's SQL Editor after creating your project.

-- Enable pgvector for memory embeddings
create extension if not exists vector;

create table clients (
    id uuid primary key default gen_random_uuid(),
    name text not null,
    business_type text,
    contact_info jsonb,
    status text default 'active',
    created_at timestamptz default now(),
    updated_at timestamptz default now()
);

create table projects (
    id uuid primary key default gen_random_uuid(),
    client_id uuid references clients(id) on delete cascade,
    title text not null,
    description text,
    status text default 'active',
    deadline timestamptz,
    created_at timestamptz default now(),
    updated_at timestamptz default now()
);

create table tasks (
    id uuid primary key default gen_random_uuid(),
    project_id uuid references projects(id) on delete cascade,
    title text not null,
    description text,
    owner text,
    priority text default 'medium',
    status text default 'pending',
    due_date timestamptz,
    created_at timestamptz default now()
);

create table conversations (
    id uuid primary key default gen_random_uuid(),
    source text default 'whatsapp',
    message text,
    response text,
    agent_used text,
    timestamp timestamptz default now()
);

create table memory_embeddings (
    id uuid primary key default gen_random_uuid(),
    content text not null,
    embedding vector(1536),
    source_type text,
    source_id text,
    created_at timestamptz default now()
);

create table content_calendar (
    id uuid primary key default gen_random_uuid(),
    brand text not null,
    platform text,
    content_type text,
    caption text,
    scheduled_date date,
    status text default 'draft',
    created_at timestamptz default now()
);

create table invoices (
    id uuid primary key default gen_random_uuid(),
    client_id uuid references clients(id) on delete set null,
    amount numeric,
    currency text default 'PKR',
    status text default 'pending',
    due_date date,
    created_at timestamptz default now()
);

create table decisions_log (
    id uuid primary key default gen_random_uuid(),
    decision_type text,
    context jsonb,
    suggestion text,
    outcome text,
    created_at timestamptz default now()
);

create table pending_approvals (
    id uuid primary key default gen_random_uuid(),
    action text,
    risk_level text,
    status text default 'pending',
    created_at timestamptz default now(),
    resolved_at timestamptz
);

create index idx_projects_client on projects(client_id);
create index idx_tasks_project on tasks(project_id);
create index idx_tasks_status on tasks(status);
create index idx_conversations_timestamp on conversations(timestamp desc);

create or replace function match_memory(
    query_embedding vector(1536),
    match_count int default 5
)
returns table (
    id uuid,
    content text,
    source_type text,
    source_id text,
    similarity float
)
language sql stable
as $$
    select
        memory_embeddings.id,
        memory_embeddings.content,
        memory_embeddings.source_type,
        memory_embeddings.source_id,
        1 - (memory_embeddings.embedding <=> query_embedding) as similarity
    from memory_embeddings
    order by memory_embeddings.embedding <=> query_embedding
    limit match_count;
$$;
