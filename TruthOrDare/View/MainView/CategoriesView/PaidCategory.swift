//
//  PaidCategory.swift
//  TruthOrDare
//
//  Created by Алексей Баранов on 14.09.2022.
//

import SwiftUI

struct PaidCategory: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var category: CategoryModel?

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                if let unwrapCategory = category {
                    VStack {
                        Text(unwrapCategory.title)
                            .tdTypo(.title4)
                            .padding(.bottom)
                        Image(unwrapCategory.icon)
                            .resizable()
                            .background(category?.background)
                            .frame(width: 150, height: 150, alignment: .center)
                            .cornerRadius(75)
                        Divider()
                            .padding(.top)
                        TabView {
                            ForEach(0...2, id: \.self) { index in
                                Text(unwrapCategory.questions[index])
                            }
                        }
                        .tabViewStyle(.page)
                        .indexViewStyle(.page(backgroundDisplayMode: .always))
                        Spacer()
                        TdActionButton(title: NSLocalizedString("Try", comment: " "), background: Color.TD.orangeGradient) {
                        }
                        .padding()
                    }
                    .padding(.bottom)
                }
            }
        }
    }
}

struct PaidCategory_Previews: PreviewProvider {
    static var previews: some View {
        PaidCategory(category: .constant(CategoryModel(title: "Разминка",
                                                       icon: "Bird",
                                                       isLock: true,
                                                       background: Color(.sRGB, red: 0.702, green: 0.910, blue: 0.941, opacity: 1),
                                                       questions: [
                                                        "Если бы у вас была машина времени, в какой период вы бы поехали?",
                                                        "Вы когда-нибудь были загипнотизированы?",
                                                        "За кого вы голосовали? Или за кого бы вы проголосовали?",
                                                        "Если бы вам пришлось выбирать ум или красоту, что бы вы выбрали?",
                                                        "Какой самый худший подарок вы когда-либо получали?",
                                                        "Если бы вашу жизнь сняли в кино, кто бы вас сыграл?",
                                                        "Сколько раз вы тайком убегали из дома?",
                                                        "Можете ли вы прикоснуться языком к носу?",
                                                        "Если бы вы могли жить где угодно в мире, где бы вы жили?",
                                                        "Какой день в вашей жизни был лучшим?",
                                                        "Вы занимаетесь каким-нибудь спортом?",
                                                        "Был ли какой-нибудь учитель, которого вы считали горячим? Кого? Почему?",
                                                        "Вы ведете дневник?",
                                                        "Вы бы когда-нибудь начали использовать сайт знакомств?",
                                                        "Какой самый мерзкий розыгрыш вы над кем-то разыграли?",
                                                        "Какой у вас был любимый мультфильм в детстве?",
                                                        "Какой был ваш худший поцелуй?",
                                                        "Вас когда-нибудь рвало в чьей-то машине?",
                                                        "Вы бы предпочли быть умным или счастливым, и почему?",
                                                        "Вы когда-нибудь болели заболеванием, передающимся половым путем?",
                                                        "Когда вы научились ездить на велосипеде?",
                                                        "Если бы не было денег, что бы вы делали со своей жизнью?",
                                                        "Вы когда-нибудь ходили во сне?",
                                                        "Вы спите голым?",
                                                        "Вы когда-нибудь что-то ломали и обвиняли кого-то другого в этом?",
                                                        "Вы когда-нибудь приводили кого-нибудь в дом без разрешения?",
                                                        "Что в вас самое странное? Вы этим гордитесь?",
                                                        "Кто ваш любимый персонаж Диснея?",
                                                        "Что бы вы сделали, если бы на день были невидимы?"
                                                       ],
                                                       actions: [
                                                        "Прокатите по комнате кого-нибудь из группы на спине.",
                                                        "Приклейте два бумажных или пластиковых стаканчика на переднюю часть рубашки.",
                                                        "Прочтите таблицу умножения числа 2.",
                                                        "Поделитесь футболкой с человеком справа на следующие 3 раунда.",
                                                        "Имитируйте китайский акцент в течение 2ух раундов.",
                                                        "Не говорите «да» или «нет» в течение 1 минуты.",
                                                        "Станцуйте Макарену.",
                                                        "Попробуйте продать лед на улице.",
                                                        "Отправьте электронное письмо одному из ваших учителей, рассказав им о том, как проходит ваш день.",
                                                        "Покрасьте ногти восковым мелком.",
                                                        "Съешьте ложку соли.",
                                                        "Разместите в сети неловкое изображение себя.",
                                                        "Занюхайте полоску сахара.",
                                                        "Завяжите глаза, сделайте 10 вращений и пройдите по улице и обратно.",
                                                        "Возьмите немного пудры в руки и похлопайте человека слева от вас по щеке.",
                                                        "Оберните голову футболкой и посидите так один раунд.",
                                                        "Прочтите вслух последнее полученное сообщение.",
                                                        "Сделайте 50 прыжков.",
                                                        "Напишите пост в Facebook (или других социальных сетях), используя только пальцы ног.",
                                                        "Изобразите работу своей мечты.",
                                                        "Позвоните случайному человеку и спойте ему с днем рождения.",
                                                        "Стойте как фламинго следующие четыре раунда.",
                                                        "Сделайте головной убор из туалетной бумаги и позируйте для фото.",
                                                        "Похлопайте человека слева от вас по попе.",
                                                        "Поцелуйте соседа справа в щеку.",
                                                        "Целуйтесь с кем-нибудь на протяжении 5 минут.",
                                                        "Изобразите любимую знаменитость.",
                                                        "Выйдите на улицу и спойте «Танец маленьких утят» со всеми действиями.",
                                                        "Придумайте рассказ о предмете справа."
                                                       ])))
    }
}
