# Instruções:
# 1. Instale a extensão do Nautilus para Python:
#    sudo apt install nautilus-python
# 2. Salve este script em ~/.local/share/nautilus-python/extensions/open_in_code.py
# 3. Dê permissão de execução:
#    chmod +x ~/.local/share/nautilus-python/extensions/open_in_code.py
# 4. Reinicie o Nautilus:
#    nautilus -q


# Extensão para abrir diretórios no VS Code através do menu de contexto do Nautilus
import os
from typing import List
from urllib.parse import unquote

from gi.repository import GObject, Nautilus


class OpenCodeExtension(GObject.GObject, Nautilus.MenuProvider):
    def _open_code(self, file: Nautilus.FileInfo) -> None:
        filename = unquote(file.get_uri()[7:])

        # Abre o diretório no VS Code
        os.system(f"code '{filename}'")

    def menu_activate_cb(
        self,
        menu: Nautilus.MenuItem,
        file: Nautilus.FileInfo,
    ) -> None:
        self._open_code(file)

    def menu_background_activate_cb(
        self,
        menu: Nautilus.MenuItem,
        file: Nautilus.FileInfo,
    ) -> None:
        self._open_code(file)

    def get_file_items(
        self,
        files: List[Nautilus.FileInfo],
    ) -> List[Nautilus.MenuItem]:
        if len(files) != 1:
            return []

        file = files[0]
        if file.get_uri_scheme() != "file":
            return []

        # Funciona tanto para diretórios quanto para arquivos
        item = Nautilus.MenuItem(
            name="NautilusPython::opencode_file_item",
            label="Abrir no VS Code",
            tip="Abrir %s no VS Code" % file.get_name(),
            icon="code",  # Ícone do VS Code
        )
        item.connect("activate", self.menu_activate_cb, file)

        return [
            item,
        ]

    def get_background_items(
        self,
        current_folder: Nautilus.FileInfo,
    ) -> List[Nautilus.MenuItem]:
        item = Nautilus.MenuItem(
            name="NautilusPython::opencode_background_item",
            label="Abrir no VS Code",
            tip="Abrir %s no VS Code" % current_folder.get_name(),
        )
        item.connect("activate", self.menu_background_activate_cb, current_folder)

        return [
            item,
        ]
