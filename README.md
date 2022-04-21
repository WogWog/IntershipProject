# IntershipProject
Mobile application "Currency converter"

  The screen contains a list of available currencies with tiles, which we get through the REST API. Today is selected by default. Clicking on a date will take you to the date selection. Selecting a currency will take you to the “Currency Details” screen.
  The screen displays the history of changes in the exchange rates of the selected currency against USD in a list (date, value). The currency identifier is passed from the list of currencies. We get the currency history by calling the corresponding REST API.
  The screen contains the full name of the currency, the exchange rate for the date selected on the “List of currencies” screen. It is also possible to convert the amount in the selected currency into rubles. When changing the value in the input field, the value in rubles is recalculated automatically.
  
  Экран отображает историю изменений обменных курсов выбранной валюты относительно USD списком (дата, значение). Идентификатор валюты передаётся из списка валют. Историю валюты получаем вызовом соответствующего REST API.
  На экране присутствует список доступных валют плиткой, которую получаем через REST API. По умолчанию выбран сегодняшний день. При нажатии на дату происходит переход к выбору даты. При выборе валюты происходит переход на экран “Детали валюты”.
  Экран содержит полное название валюты, курс валюты на дату, выбранную на экране “Список валют”. Также присутствует возможность конвертировать сумму в выбранной валюте в рубли. При изменении значения в поле ввода, значение в рублях пересчитывается автоматически.

https://user-images.githubusercontent.com/83632297/164550117-e0b1235e-9444-42ec-b84c-33af6aec2cfa.mp4

