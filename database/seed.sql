INSERT INTO usuarios (nombre, email, password, telefono) VALUES
    ('Ivo Mena',        'ivo@mail.com',     'clave123', '+5493815000001'),
    ('Lucia Gomez',     'lucia@mail.com',   'clave123', '+5493815000002'),
    ('Martin Perez',    'martin@mail.com',  'clave123', '+5493815000003'),
    ('Sofia Ramirez',   'sofia@mail.com',   'clave123', '+5493815000004'),
    ('Tomas Herrera',   'tomas@mail.com',   'clave123', NULL);

INSERT INTO categorias (nombre) VALUES
    ('Estudio'),
    ('Trabajo'),
    ('Casa'),
    ('Salud'),
    ('Compras');

INSERT INTO tareas (titulo, descripcion, estado, fecha_vencimiento, usuario_id, categoria_id) VALUES
    ('Entregar TP9 de Programacion IV', 'Backend con NestJS y PostgreSQL',      'en_progreso', '2026-11-11', 1, 1),
    ('Estudiar para el parcial',        'Repasar React y Bootstrap',            'pendiente',   '2026-11-20', 1, 1),
    ('Enviar informe mensual',          'Informe de ventas al jefe',            'pendiente',   '2026-11-15', 2, 2),
    ('Reunion con el equipo',           NULL,                                   'completada',  '2026-11-05', 2, 2),
    ('Limpiar la casa',                 'Cocina y living',                      'pendiente',   '2026-11-12', 3, 3),
    ('Turno con el dentista',           'Llevar el carnet de la obra social',   'pendiente',   '2026-11-18', 3, 4),
    ('Comprar verduras',                NULL,                                   'completada',  '2026-11-08', 4, 5),
    ('Salir a correr',                  '30 minutos por la tarde',              'en_progreso', NULL,         4, 4),
    ('Pagar el alquiler',               'Transferencia antes del dia 10',       'pendiente',   '2026-11-10', 5, 3),
    ('Armar lista de ideas',            'Tarea sin categoria',                  'pendiente',   NULL,         5, NULL);
