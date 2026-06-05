// Базовый URL API (подставьте свой путь)
const API_BASE = 'api.php';

// Вспомогательная функция для запросов
async function apiRequest(endpoint, method, body = null) {
    const options = {
        method,
        headers: { 'Content-Type': 'application/json' },
    };
    if (body) options.body = JSON.stringify(body);
    const response = await fetch(`${API_BASE}/${endpoint}`, options);
    if (!response.ok) throw new Error(`HTTP ${response.status}`);
    return await response.json();
}

// ========== ЗАГРУЗКА ВСЕХ ДАННЫХ ==========
async function loadAllData() {
    await loadProfile();
    await loadAddresses();
    await loadCards();
    await loadSettings();
    updateHeaderInfo(); // обновить имя и email в шапке
}

async function loadProfile() {
    const user = await apiRequest('profile', 'GET');
    document.getElementById('editFirstName').value = user.first_name || '';
    document.getElementById('editLastName').value = user.last_name || '';
    document.getElementById('editEmail').value = user.email || '';
    document.getElementById('editPhone').value = user.phone || '';
    // также обновить глобальную переменную userData, если используете
    window.userData = user;
}

async function saveProfile() {
    const data = {
        firstName: document.getElementById('editFirstName').value,
        lastName: document.getElementById('editLastName').value,
        email: document.getElementById('editEmail').value,
        phone: document.getElementById('editPhone').value,
    };
    await apiRequest('profile', 'PUT', data);
    showToast('Профиль сохранён');
    await loadProfile(); // перезагрузить
    updateHeaderInfo();
}

// ========== АДРЕСА ==========
async function loadAddresses() {
    const addresses = await apiRequest('addresses', 'GET');
    renderAddresses(addresses);
}

async function addAddress(type, address) {
    await apiRequest('addresses', 'POST', { type, address });
    await loadAddresses();
}

async function updateAddress(id, type, address) {
    await apiRequest('addresses', 'PUT', { id, type, address });
    await loadAddresses();
}

async function deleteAddress(id) {
    await apiRequest(`addresses?id=${id}`, 'DELETE');
    await loadAddresses();
}

// ========== КАРТЫ ==========
async function loadCards() {
    const cards = await apiRequest('cards', 'GET');
    renderCards(cards);
}

async function addCard(last4, brand) {
    await apiRequest('cards', 'POST', { last4, brand });
    await loadCards();
}

async function updateCard(id, last4, brand) {
    await apiRequest('cards', 'PUT', { id, last4, brand });
    await loadCards();
}

async function deleteCard(id) {
    await apiRequest(`cards?id=${id}`, 'DELETE');
    await loadCards();
}

// ========== НАСТРОЙКИ ==========
async function loadSettings() {
    const settings = await apiRequest('settings', 'GET');
    document.getElementById('notifyEmail').checked = settings.email_notify;
    document.getElementById('notifySms').checked = settings.sms_notify;
}

async function saveSettings() {
    const data = {
        email_notify: document.getElementById('notifyEmail').checked,
        sms_notify: document.getElementById('notifySms').checked,
    };
    await apiRequest('settings', 'PUT', data);
    showToast('Настройки сохранены');
}

// ========== ВСПОМОГАТЕЛЬНЫЕ ==========
function updateHeaderInfo() {
    // обновляем имя пользователя в шапке
    if (window.userData) {
        document.getElementById('userNameDisplay').innerText = `${window.userData.first_name} ${window.userData.last_name}`;
        document.getElementById('userEmailDisplay').innerText = window.userData.email;
    }
}

function showToast(msg) {
    // ваш код уведомления
}

// Загружаем данные при старте
document.addEventListener('DOMContentLoaded', () => {
    loadAllData();
    // привязать обработчики кнопок сохранения...
});