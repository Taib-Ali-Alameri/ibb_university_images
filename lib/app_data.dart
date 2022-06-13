import 'package:ibb_university_images/models/photo.dart';

import 'models/college.dart';

const collegesData = [
  College(
    id: 'c1',
    title: 'عامة',
    imageUrl: 'images/categories/mountains.jpg',
  ),
  College(
    id: 'c2',
    title: 'رئاسة الجامعة',
    imageUrl: 'images/categories/lakes.jpg',
  ),
  College(
    id: 'c3',
    title: 'كلية العلوم',
    imageUrl: 'images/categories/beaches.jpg',
  ),
  College(
    id: 'c4',
    title: 'كلية الطب',
    imageUrl: 'images/categories/deserts.jpg',
  ),
  College(
    id: 'c5',
    title: 'كلية الأسنان',
    imageUrl: 'images/categories/ancients.jpg',
  ),
  College(
    id: 'c6',
    title: 'كلية الزراعة',
    imageUrl: 'images/categories/snow.jpg',
  ),
];

const photoesData = [
  Photo(
    id: "1",
    collegeId: "c1",
    title: "بوابة الجامعة الشرقية",
    imageUrl: "images/categories/ancients.jpg",
    description:
        "ا-قم ببرمجة تطبيق يحسب مجموع خانات أي عدد مثلا عند ادخال 784211 يكون الناتج 23  بدون استخدام المصفوف\nب- قم ببرمجة تطبيق  لحساب معدل ذكائك من 100\n\nج- قم ببرمجة تطبيق يقوم بفلترة درجات  مادة من 100 الى 30.\nد-قم ببرمجة تطبيق يقوم بعكس خانات الرقم المدخل مثلا اذا تم ادخال 78421 كان الناتج بدون استخدام المصفوفة",
    userId: "user 1",
  ),
  Photo(
    id: "2",
    collegeId: "c1",
    title: "بوابة الجامعة الغربية",
    imageUrl: "images/categories/snow.jpg",
    description:
        "قم ببرمجة تطبيق يقوم  بتخزين اسم المستخدم وكلمه المرور والتخصص \n في shared preferences  عند النقر على زر حفظ \nويعرض بيانات جميع المستخدمين عند النقر على زر عرض   برساله .toast",
    userId: "user 2",
  ),
  Photo(
    id: "3",
    collegeId: "c2",
    title: "شارع الرئاسة",
    imageUrl: "images/categories/deserts.jpg",
    description:
        "قم ببرمجة تطبيق يقوم  بتخزين اسم المستخدم وكلمه المرور \nبقاعدة بيانات SQLite  عند النقر على زر حفظ \nويعرض   المستخدم مع كلمه مروره عند النقر على زر عرض  برساله .toast",
    userId: "user 1",
  ),
  Photo(
    id: "4",
    collegeId: "c2",
    title: "حوش الرئاسة",
    imageUrl: "images/categories/lakes.jpg",
    description:
        "قم ببرمجة تطبيق يقوم  بتخزين اسم المستخدم وكلمه المرور \nبقاعدة بيانات MYSQL  عند النقر على زر حفظ \nويعرض جميع المستخدمين عند النقر على زر عرض  في list view .يجب مرعاه الترتيب التالي \n1-كتابة ملفات PHP\n2-برمجة الزر حفظ  ثم عرض",
    userId: "user 2",
  ),
];
