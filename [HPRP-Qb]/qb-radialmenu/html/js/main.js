"use strict";

var QBRadialMenu = null;
var toggleConfig = false;
var keybindConfig = false;
$(document).ready(function () {
/* LUMIHUD COLOR HOOK (v6) */
window.addEventListener("message", function (event) {
    if (event.data && event.data.action === 'updateColor') {
        try {
            var c   = event.data.color;
            var hex = '#c92a2a';
            if (typeof c === 'string') { hex = c; }
            else if (c && typeof c === 'object' && typeof c.background === 'string') { hex = c.background; }

            var withOpacity70 = hex + 'b3';
            var withOpacity60 = hex + '9d';
            var withOpacity40 = hex + '66';
            var withOpacity15 = hex + '26';
            document.documentElement.style.setProperty('--radial-color', hex);
            document.documentElement.style.setProperty('--radial-glow',  withOpacity60);
            document.documentElement.style.setProperty('--radial-glow2', withOpacity40);
            document.documentElement.style.setProperty('--radial-border', hex);
            document.documentElement.style.setProperty('--radial-border-dim', withOpacity15);
        } catch (e) {}
    }
});

    window.addEventListener("message", function (event) {
        switch (event.data.action) {
            case "ui":
                toggleConfig = event.data.toggle;
                keybindConfig = event.data.keybind;
                if (event.data.radial) {
                    createMenu(event.data.items);
                    QBRadialMenu.open();
                } else {
                    QBRadialMenu.close(true);
                }
                if (toggleConfig === false) {
                    $(document).on("keyup", function (e) {
                        if ((e.key == keybindConfig) | (e.key === keybindConfig.toLowerCase())) {
                            QBRadialMenu.close();
                        }
                    });
                } else {
                    $(document).on("keydown", function (e) {
                        switch (e.key) {
                            case keybindConfig:
                                QBRadialMenu.close();
                                break;
                        }
                    });
                }
        }
    });
});
function createMenu(items) {
    QBRadialMenu = new RadialMenu({
        parent: document.body,
        size: 375,
        menuItems: items,
        onClick: function (item) {
            if (item.shouldClose) {
                QBRadialMenu.close(true);
            }

            if (item.items == null && item.shouldClose != null) {
                $.post(
                    "https://qb-radialmenu/selectItem",
                    JSON.stringify({
                        itemData: item,
                    })
                );
            }
        },
    });
}

// Close on escape pressed
$(document).on("keydown", function (e) {
    switch (e.key) {
        case "Escape":
            QBRadialMenu.close();
            break;
    }
});

document.addEventListener('mousemove', function(e) {
    const centerIcons = document.querySelectorAll('svg.menu > g.center');
    centerIcons.forEach(centerIcon => {
        const menuHolder = document.querySelector('div.menuHolder');
        const rect = menuHolder.getBoundingClientRect();
        const mouseX = e.clientX;
        const mouseY = e.clientY;

        const centerX = rect.left + rect.width / 2;
        const centerY = rect.top + rect.height / 2;

        const angle = Math.atan2(mouseY - centerY, mouseX - centerX);
        const degrees = angle * (180 / Math.PI);

        // Açıya 180 ekleyerek dönüş yönünü tersine çevir
        centerIcon.style.transform = `rotate(${degrees + 180}deg)`;
    });
});