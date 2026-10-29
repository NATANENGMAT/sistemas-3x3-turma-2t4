-- =========================================================================
-- SCRIPT DE CONFIGURAÇÃO DO SUPABASE - TURMA 2º 4 (PROF. NATANAEL)
-- =========================================================================
-- Execute este script no SQL Editor do seu projeto Supabase:
-- https://supabase.com/dashboard/project/jzepdmolnoobgbgdavyf/editor

-- 1. Garante que a tabela remota_alunos exista e tenha leitura pública liberada
CREATE TABLE IF NOT EXISTS public.remota_alunos (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  created_at timestamp with time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
  nome text NOT NULL,
  turma text DEFAULT '2º 4'
);

ALTER TABLE public.remota_alunos ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Leitura pública remota_alunos" ON public.remota_alunos;
CREATE POLICY "Leitura pública remota_alunos" 
ON public.remota_alunos FOR SELECT USING (true);

DROP POLICY IF EXISTS "Inserção pública remota_alunos" ON public.remota_alunos;
CREATE POLICY "Inserção pública remota_alunos" 
ON public.remota_alunos FOR INSERT WITH CHECK (true);

-- 2. Insere os 23 estudantes oficiais da Turma 2º 4 (EETI Jacimar da Silva Gama)
INSERT INTO public.remota_alunos (nome, turma)
SELECT v.nome, '2º 4'
FROM (VALUES
  ('Emanuel Nunes'),
  ('Emanuelly Melo'),
  ('Leonardo Lima'),
  ('Maria Eduarda'),
  ('Maria Luisa'),
  ('Micaela Dos Santos'),
  ('Nicolas Carvalho'),
  ('Pedro Henrique'),
  ('Priscila Evellyn'),
  ('Rayanna Ribeiro'),
  ('Rayra Alana'),
  ('Renata Sophia'),
  ('Rian De Sa Ribeiro'),
  ('Sarah Melo'),
  ('Sophia Da Silva'),
  ('Sophya Oliveira'),
  ('Taicilane Pedroza'),
  ('Victor Aldenney'),
  ('Victor Braiam'),
  ('Vitor Eduardo'),
  ('Vitoria Julia'),
  ('Yasmin Giovana'),
  ('Yellen Biatriz')
) AS v(nome)
WHERE NOT EXISTS (
  SELECT 1 FROM public.remota_alunos r 
  WHERE LOWER(TRIM(r.nome)) = LOWER(TRIM(v.nome))
);

-- 3. Cria a tabela oficial para registrar as entregas e fotos dos alunos do 2º 4
CREATE TABLE IF NOT EXISTS public.entregas_sistemas_2t4 (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  created_at timestamp with time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
  nome text NOT NULL,
  turma text DEFAULT '2º 4',
  total_fotos integer DEFAULT 0,
  questoes_respostas jsonb
);

-- Habilita o acesso total (inserção para os alunos e consulta para o professor)
ALTER TABLE public.entregas_sistemas_2t4 ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Acesso público entregas 2t4" ON public.entregas_sistemas_2t4;
CREATE POLICY "Acesso público entregas 2t4" 
ON public.entregas_sistemas_2t4 FOR ALL USING (true);

-- 4. Cria o bucket de armazenamento para uploads diretos (opcional)
INSERT INTO storage.buckets (id, name, public) 
VALUES ('fotos-resolucoes', 'fotos-resolucoes', true)
ON CONFLICT (id) DO NOTHING;

DROP POLICY IF EXISTS "Upload público de fotos" ON storage.objects;
CREATE POLICY "Upload público de fotos" 
ON storage.objects FOR INSERT 
WITH CHECK (bucket_id = 'fotos-resolucoes');

DROP POLICY IF EXISTS "Visualização pública de fotos" ON storage.objects;
CREATE POLICY "Visualização pública de fotos" 
ON storage.objects FOR SELECT 
USING (bucket_id = 'fotos-resolucoes');
