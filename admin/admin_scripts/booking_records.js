
    function get_bookings(search='',page = 1){
    let xhr = new XMLHttpRequest();
    xhr.open("POST","admin_ajax/booking_records.php",true);
    xhr.setRequestHeader('Content-Type','application/x-www-form-urlencoded');

    xhr.onload = function() {

        let data = JSON.parse(this.responseText);    
        document.getElementById('table-data').innerHTML= data.table_data;
        document.getElementById('table-pagination').innerHTML= data.pagination;
    }
    xhr.send('get_bookings&search='+search+'&page='+page);
    }



    function change_page(page) {
    get_bookings(document.getElementById('search_input').value,page);
    }

    function download(id) {
        window.location.href = 'generate_pdf.php?gen_pdf&id='+id;
    }


    function showCalendar() {
    document.getElementById('calendar-container').style.display = 'block';
    document.querySelector('.table-responsive').style.display = 'none';
    document.getElementById('table-pagination').style.display = 'none';
    document.getElementById('search_input').style.display = 'none';

    if (!window.calendarInitialized) {
        fetchBookingsForCalendar();
        window.calendarInitialized = true;
    }
}

function showTable() {
    document.getElementById('calendar-container').style.display = 'none';
    document.querySelector('.table-responsive').style.display = 'block';
    document.getElementById('table-pagination').style.display = 'flex';
    document.getElementById('search_input').style.display = 'block';
}

function fetchBookingsForCalendar() {
    let xhr = new XMLHttpRequest();
    xhr.open("POST", "admin_ajax/booking_records.php", true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

    xhr.onload = function () {
        let bookings = JSON.parse(this.responseText);

        let calendarEl = document.getElementById('calendar');
        let calendar = new FullCalendar.Calendar(calendarEl, {
            initialView: 'dayGridMonth',
            height: 650,
            events: bookings,
            headerToolbar: {
                left: 'prev,next today',
                center: 'title',
                right: 'dayGridMonth,timeGridWeek'
            }
        });

        calendar.render();
    };

    xhr.send('get_calendar_bookings');
}





window.onload = function(){
    get_bookings();
}
