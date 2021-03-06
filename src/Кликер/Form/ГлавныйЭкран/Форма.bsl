﻿&НаКлиенте
Перем Дата1;

&НаКлиенте
Процедура НачатьДобычу(Команда)

	ПодключитьОбработчикОжидания("СтартДобычаМонет", 1, false);
	
КонецПроцедуры

&НаКлиенте
Процедура ОстановитьДобычу(Команда)

	ОтключитьОбработчикОжидания("СтартДобычаМонет");
	
КонецПроцедуры

&НаКлиенте
Процедура СтартДобычаМонет()
	
	Объект.Монеты = Объект.Монеты + 1 + Объект.ЧислоРабочих + (Объект.ЧислоФерм * 3) + (Объект.ЧислоЗаводов * 5);
	
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	
	Приветствие();
	ПодключитьОбработчикОжидания("ОбновлениеВремени", 1, false);
	ПодключитьОбработчикОжидания("ПодключениеСобытий", 1, false);
	ПодключитьОбработчикОжидания("ПроверкаУсловийОповещенияОМонетах", 1, false);
	
КонецПроцедуры

&НаКлиенте
Процедура КупитьРабочего(Команда) 
	
	Если Объект.Монеты >= 30 Тогда
		Объект.Монеты = Объект.Монеты - 30;
		Объект.ЧислоРабочих = Объект.ЧислоРабочих + 1;
	Иначе
		Сообщить("Не хвататет монет, подкопи еще чуток.");
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура КупитьФерму(Команда)
	
	Если Объект.Монеты >= 70 Тогда
		Объект.Монеты = Объект.Монеты - 70;
		Объект.ЧислоФерм = Объект.ЧислоФерм + 1;
	Иначе
		Сообщить("Не хвататет монет, подкопи еще чуток.");
	КонецЕсли;

	
КонецПроцедуры

&НаКлиенте
Процедура КупитьЗавод(Команда)
	
	Если Объект.Монеты >= 120 Тогда
		Объект.Монеты = Объект.Монеты - 120;
		Объект.ЧислоЗаводов = Объект.ЧислоЗаводов + 1;
	Иначе
		Сообщить("Не хвататет монет, подкопи еще чуток.");
	КонецЕсли;

	
КонецПроцедуры

&НаКлиенте
Процедура Приветствие()
	
	Рандом = Новый ГенераторСлучайныхЧисел();
	СлучайноеЧисло = Рандом.СлучайноеЧисло(1, 5);
	
	Если СлучайноеЧисло = 1 тогда
		Сообщить("Здорово, друщие!");
	ИначеЕсли СлучайноеЧисло = 2 тогда
		Сообщить("Приветствую тебя, товарищ!");
	ИначеЕсли СлучайноеЧисло = 3 тогда
		Сообщить("Привет игрок!");
	ИначеЕсли СлучайноеЧисло = 4 тогда
		Сообщить("Ну что, поиграем?");
	ИначеЕсли СлучайноеЧисло = 5 тогда
		Сообщить("Еу бро, хай!");
	Иначе
		Сообщить("Здрасте!");
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ОбновлениеВремени()
	
	Объект.ТекущееВремя = ТекущаяДата();
	
КонецПроцедуры

&НаКлиенте
Процедура ПораДомой()

	Если Объект.ТекущееВремя >= Дата1 Тогда
		Сообщить("Хватит играть! Пора домой!");
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ПодключитьОповещениеКогдаДомой(Команда)
	
	ПодключитьОбработчикОжидания("ПораДомой", 1, false);
	Сообщить("Обработчик подключен!");	
КонецПроцедуры

&НаКлиенте
Процедура ОтключитьОповещениеКогдаДомой(Команда)
	
	ОтключитьОбработчикОжидания("ПораДомой");
	Сообщить("Обработчик отключен!");
	
КонецПроцедуры

&НаКлиенте
Процедура ПодключениеСобытий()
	
	Если Объект.Монеты >= 150 Тогда
		ПодключитьОбработчикОжидания("СлучайныеСобытия", 100, false);
		ОтключитьОбработчикОжидания("ПодключениеСобытий");
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ОповещениеОМонетах()
	
	Сообщить("Люди узнали о вашем, не плохом, доходе!");
	
КонецПроцедуры

&НаКлиенте
Процедура ПроверкаУсловийОповещенияОМонетах()
	
	Если Объект.Монеты >= 150 Тогда
		ПодключитьОбработчикОжидания("ОповещениеОМонетах", 1, true);
		ОтключитьОбработчикОжидания("ПроверкаУсловийОповещенияОМонетах");
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура СлучайныеСобытия()
	
	Рандом = Новый ГенераторСлучайныхЧисел();
	СлучайноеЧисло = Рандом.СлучайноеЧисло(1, 6);
	
	Если СлучайноеЧисло = 1 Тогда
		ОтключениеСвета();
	ИначеЕсли СлучайноеЧисло = 2 Тогда
		Болезнь();
	ИначеЕсли СлучайноеЧисло = 3 Тогда
		Вор();
	ИначеЕсли СлучайноеЧисло = 4 Тогда
		Налоги();
	ИначеЕсли СлучайноеЧисло = 5 Тогда
		Ограбление();
	ИначеЕсли СлучайноеЧисло = 6 Тогда
		ПоломкаИнструментов();
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ОтключениеСвета()
	
	Объект.Монеты = Объект.Монеты - 15;
	Сообщить("К сожалению, у вас отключили свет!");
	
КонецПроцедуры

&НаКлиенте
Процедура Болезнь()
	
	Объект.Монеты = Объект.Монеты - 25;
	Сообщить("Вы и ваши сотрудники заболели!");
	
КонецПроцедуры

&НаКлиенте
Процедура Вор()
	
	Объект.Монеты = Объект.Монеты - 30;
	Сообщить("К вам пробрался вор!");
	
КонецПроцедуры

&НаКлиенте
Процедура Налоги()
	
	Объект.Монеты = Объект.Монеты - 50;
	Сообщить("Пришло время платить налоги!");
	
КонецПроцедуры

&НаКлиенте
Процедура Ограбление()
	
	Объект.Монеты = Объект.Монеты - 75;
	Сообщить("О нет! Это ограбление!");
	
КонецПроцедуры

&НаКлиенте
Процедура ПоломкаИнструментов()
	
	Объект.Монеты = Объект.Монеты - 90;
	Сообщить("Черт возьми! Сломались инструменты!");
	
КонецПроцедуры


Дата1 = '00010101180000';









