document.addEventListener('DOMContentLoaded', function () {
  var calendarEl = document.getElementById('calendar');

  var calendar = new FullCalendar.Calendar(calendarEl, {
    initialView: 'dayGridMonth',
    initialDate: '2023-01-01',
    headerToolbar: {
      left: 'prev,next today',
      center: 'title',
      right: 'dayGridMonth,timeGridWeek,timeGridDay',
      url: 'https://malankaralibrary.com/book/details/2161/Malankara_Orthodox_Syrian_Church_Liturgical_Calendar_2023'
    },
    //## Start Calendar:
events: [
{"title": "Holy Communition","url": "/about.html","start": "2023-05-28","end": "2023-05-30"}
,
{"title": "Holy Communition 2","url": "","start": "2023-07-28","end": "2023-07-28"}
]
    //## EOCalendar
    // events: [
    //   {
    //     title: 'New Year (First Sunday after Christmas)',
    //     url: 'https://malankaralibrary.com/book/details/2161/Malankara_Orthodox_Syrian_Church_Liturgical_Calendar_2023',
    //     start: '2023-01-01',
    //     end: '2023-01-01'
    //   },
    //   {
    //     title: 'Epiphany/Danaha (Baptism of our Lord Jesus Christ)',
    //     start: '2023-01-06',
    //     end: '2023-01-06'
    //   },
    //   {
    //     title: 'First Sunday after Epiphany',
    //     start: '2023-01-08',
    //     end: '2023-01-08'
    //   },
    // ]
  });
  calendar.render();
});
