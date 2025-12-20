#!/usr/bin/osascript -l JavaScript

(() => {
    // Obtiene una lista de todos los procesos del sistema
    const processes = Application("System Events").processes;

    // Filtra para obtener solo las aplicaciones que no son de segundo plano
    // y extrae sus nombres.
    const appNames = processes.whose({ backgroundOnly: false }).name();

    // Convierte la lista de nombres en un string JSON.
    // Alfred y otras herramientas pueden parsear esto fácilmente.
    const alfredItems = appNames.map(name => {
        return {
            title: name,
            arg: name, // El argumento que se pasará a la siguiente acción de Alfred
        };
    });

    // Imprime el objeto JSON que Alfred espera.
    return JSON.stringify({ items: alfredItems });
})();
