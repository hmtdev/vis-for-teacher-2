PGDMP     ;    
                y            vis_for_teacher     13.2 (Ubuntu 13.2-1.pgdg20.04+1)     13.2 (Ubuntu 13.2-1.pgdg20.04+1) =    ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    17820    vis_for_teacher    DATABASE     d   CREATE DATABASE vis_for_teacher WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';
    DROP DATABASE vis_for_teacher;
                postgres    false            ?            1259    27657    Class_    TABLE     ?  CREATE TABLE public."Class_" (
    id integer NOT NULL,
    class_name character varying(100) NOT NULL,
    class_name_abbr character varying(50) NOT NULL,
    class_code character varying(50) NOT NULL,
    branch character varying(100) NOT NULL,
    major character varying(100) NOT NULL,
    major_code character varying(50) NOT NULL,
    current_semester_id integer NOT NULL,
    user_id integer NOT NULL
);
    DROP TABLE public."Class_";
       public         heap    postgres    false            ?            1259    27655    Class__id_seq    SEQUENCE     ?   CREATE SEQUENCE public."Class__id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public."Class__id_seq";
       public          postgres    false    205            ?           0    0    Class__id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public."Class__id_seq" OWNED BY public."Class_".id;
          public          postgres    false    204            ?            1259    27649    Semester    TABLE     Y   CREATE TABLE public."Semester" (
    id integer NOT NULL,
    number integer NOT NULL
);
    DROP TABLE public."Semester";
       public         heap    postgres    false            ?            1259    27726    SemesterDetail    TABLE     ?   CREATE TABLE public."SemesterDetail" (
    student_id integer NOT NULL,
    semester_id integer NOT NULL,
    semester_final_score_10 double precision,
    semester_final_score_4 double precision
);
 $   DROP TABLE public."SemesterDetail";
       public         heap    postgres    false            ?            1259    27647    Semester_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."Semester_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Semester_id_seq";
       public          postgres    false    203            ?           0    0    Semester_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."Semester_id_seq" OWNED BY public."Semester".id;
          public          postgres    false    202            ?            1259    27698    Student    TABLE     ?  CREATE TABLE public."Student" (
    id integer NOT NULL,
    full_name character varying(200) NOT NULL,
    student_code character varying(10) NOT NULL,
    course integer NOT NULL,
    passed_credit integer NOT NULL,
    registered_credit integer NOT NULL,
    cumulative_score_10 double precision,
    cumulative_score_4 double precision,
    graded character varying(20),
    char_score character varying(5),
    class_id integer NOT NULL
);
    DROP TABLE public."Student";
       public         heap    postgres    false            ?            1259    27696    Student_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."Student_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public."Student_id_seq";
       public          postgres    false    209            ?           0    0    Student_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public."Student_id_seq" OWNED BY public."Student".id;
          public          postgres    false    208            ?            1259    27683    Subject    TABLE     ?   CREATE TABLE public."Subject" (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    credit integer NOT NULL,
    semester_id integer NOT NULL
);
    DROP TABLE public."Subject";
       public         heap    postgres    false            ?            1259    27711    SubjectDetail    TABLE     ?   CREATE TABLE public."SubjectDetail" (
    student_id integer NOT NULL,
    subject_id integer NOT NULL,
    final_score_10 double precision,
    final_score_4 double precision
);
 #   DROP TABLE public."SubjectDetail";
       public         heap    postgres    false            ?            1259    27681    Subject_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."Subject_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public."Subject_id_seq";
       public          postgres    false    207            ?           0    0    Subject_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public."Subject_id_seq" OWNED BY public."Subject".id;
          public          postgres    false    206            ?            1259    27634    User    TABLE     ?   CREATE TABLE public."User" (
    id integer NOT NULL,
    username character varying(100) NOT NULL,
    password_hash character varying(200) NOT NULL,
    full_name character varying(200) NOT NULL,
    email character varying(100) NOT NULL
);
    DROP TABLE public."User";
       public         heap    postgres    false            ?            1259    27632    User_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."User_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public."User_id_seq";
       public          postgres    false    201            ?           0    0    User_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public."User_id_seq" OWNED BY public."User".id;
          public          postgres    false    200            ?           2604    27660 	   Class_ id    DEFAULT     j   ALTER TABLE ONLY public."Class_" ALTER COLUMN id SET DEFAULT nextval('public."Class__id_seq"'::regclass);
 :   ALTER TABLE public."Class_" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    204    205            ?           2604    27652    Semester id    DEFAULT     n   ALTER TABLE ONLY public."Semester" ALTER COLUMN id SET DEFAULT nextval('public."Semester_id_seq"'::regclass);
 <   ALTER TABLE public."Semester" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    202    203    203            ?           2604    27701 
   Student id    DEFAULT     l   ALTER TABLE ONLY public."Student" ALTER COLUMN id SET DEFAULT nextval('public."Student_id_seq"'::regclass);
 ;   ALTER TABLE public."Student" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    208    209            ?           2604    27686 
   Subject id    DEFAULT     l   ALTER TABLE ONLY public."Subject" ALTER COLUMN id SET DEFAULT nextval('public."Subject_id_seq"'::regclass);
 ;   ALTER TABLE public."Subject" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    206    207    207            ?           2604    27637    User id    DEFAULT     f   ALTER TABLE ONLY public."User" ALTER COLUMN id SET DEFAULT nextval('public."User_id_seq"'::regclass);
 8   ALTER TABLE public."User" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    200    201    201            y          0    27657    Class_ 
   TABLE DATA           ?   COPY public."Class_" (id, class_name, class_name_abbr, class_code, branch, major, major_code, current_semester_id, user_id) FROM stdin;
    public          postgres    false    205   ?J       w          0    27649    Semester 
   TABLE DATA           0   COPY public."Semester" (id, number) FROM stdin;
    public          postgres    false    203   ?J                 0    27726    SemesterDetail 
   TABLE DATA           t   COPY public."SemesterDetail" (student_id, semester_id, semester_final_score_10, semester_final_score_4) FROM stdin;
    public          postgres    false    211   9K       }          0    27698    Student 
   TABLE DATA           ?   COPY public."Student" (id, full_name, student_code, course, passed_credit, registered_credit, cumulative_score_10, cumulative_score_4, graded, char_score, class_id) FROM stdin;
    public          postgres    false    209   ?Q       {          0    27683    Subject 
   TABLE DATA           B   COPY public."Subject" (id, name, credit, semester_id) FROM stdin;
    public          postgres    false    207   gW       ~          0    27711    SubjectDetail 
   TABLE DATA           `   COPY public."SubjectDetail" (student_id, subject_id, final_score_10, final_score_4) FROM stdin;
    public          postgres    false    210   ?\       u          0    27634    User 
   TABLE DATA           O   COPY public."User" (id, username, password_hash, full_name, email) FROM stdin;
    public          postgres    false    201   ??       ?           0    0    Class__id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public."Class__id_seq"', 1, true);
          public          postgres    false    204            ?           0    0    Semester_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."Semester_id_seq"', 8, true);
          public          postgres    false    202            ?           0    0    Student_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."Student_id_seq"', 60, true);
          public          postgres    false    208            ?           0    0    Subject_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."Subject_id_seq"', 80, true);
          public          postgres    false    206            ?           0    0    User_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public."User_id_seq"', 1, true);
          public          postgres    false    200            ?           2606    27668    Class_ Class__class_code_key 
   CONSTRAINT     a   ALTER TABLE ONLY public."Class_"
    ADD CONSTRAINT "Class__class_code_key" UNIQUE (class_code);
 J   ALTER TABLE ONLY public."Class_" DROP CONSTRAINT "Class__class_code_key";
       public            postgres    false    205            ?           2606    27666 !   Class_ Class__class_name_abbr_key 
   CONSTRAINT     k   ALTER TABLE ONLY public."Class_"
    ADD CONSTRAINT "Class__class_name_abbr_key" UNIQUE (class_name_abbr);
 O   ALTER TABLE ONLY public."Class_" DROP CONSTRAINT "Class__class_name_abbr_key";
       public            postgres    false    205            ?           2606    27664    Class_ Class__class_name_key 
   CONSTRAINT     a   ALTER TABLE ONLY public."Class_"
    ADD CONSTRAINT "Class__class_name_key" UNIQUE (class_name);
 J   ALTER TABLE ONLY public."Class_" DROP CONSTRAINT "Class__class_name_key";
       public            postgres    false    205            ?           2606    27670    Class_ Class__major_code_key 
   CONSTRAINT     a   ALTER TABLE ONLY public."Class_"
    ADD CONSTRAINT "Class__major_code_key" UNIQUE (major_code);
 J   ALTER TABLE ONLY public."Class_" DROP CONSTRAINT "Class__major_code_key";
       public            postgres    false    205            ?           2606    27662    Class_ Class__pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."Class_"
    ADD CONSTRAINT "Class__pkey" PRIMARY KEY (id);
 @   ALTER TABLE ONLY public."Class_" DROP CONSTRAINT "Class__pkey";
       public            postgres    false    205            ?           2606    27730 "   SemesterDetail SemesterDetail_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY public."SemesterDetail"
    ADD CONSTRAINT "SemesterDetail_pkey" PRIMARY KEY (student_id, semester_id);
 P   ALTER TABLE ONLY public."SemesterDetail" DROP CONSTRAINT "SemesterDetail_pkey";
       public            postgres    false    211    211            ?           2606    27654    Semester Semester_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Semester"
    ADD CONSTRAINT "Semester_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Semester" DROP CONSTRAINT "Semester_pkey";
       public            postgres    false    203            ?           2606    27703    Student Student_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Student"
    ADD CONSTRAINT "Student_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Student" DROP CONSTRAINT "Student_pkey";
       public            postgres    false    209            ?           2606    27705     Student Student_student_code_key 
   CONSTRAINT     g   ALTER TABLE ONLY public."Student"
    ADD CONSTRAINT "Student_student_code_key" UNIQUE (student_code);
 N   ALTER TABLE ONLY public."Student" DROP CONSTRAINT "Student_student_code_key";
       public            postgres    false    209            ?           2606    27715     SubjectDetail SubjectDetail_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public."SubjectDetail"
    ADD CONSTRAINT "SubjectDetail_pkey" PRIMARY KEY (student_id, subject_id);
 N   ALTER TABLE ONLY public."SubjectDetail" DROP CONSTRAINT "SubjectDetail_pkey";
       public            postgres    false    210    210            ?           2606    27690    Subject Subject_name_key 
   CONSTRAINT     W   ALTER TABLE ONLY public."Subject"
    ADD CONSTRAINT "Subject_name_key" UNIQUE (name);
 F   ALTER TABLE ONLY public."Subject" DROP CONSTRAINT "Subject_name_key";
       public            postgres    false    207            ?           2606    27688    Subject Subject_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Subject"
    ADD CONSTRAINT "Subject_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Subject" DROP CONSTRAINT "Subject_pkey";
       public            postgres    false    207            ?           2606    27646    User User_password_hash_key 
   CONSTRAINT     c   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_password_hash_key" UNIQUE (password_hash);
 I   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_password_hash_key";
       public            postgres    false    201            ?           2606    27642    User User_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_pkey";
       public            postgres    false    201            ?           2606    27644    User User_username_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_username_key" UNIQUE (username);
 D   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_username_key";
       public            postgres    false    201            ?           2606    27671 &   Class_ Class__current_semester_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Class_"
    ADD CONSTRAINT "Class__current_semester_id_fkey" FOREIGN KEY (current_semester_id) REFERENCES public."Semester"(id);
 T   ALTER TABLE ONLY public."Class_" DROP CONSTRAINT "Class__current_semester_id_fkey";
       public          postgres    false    3027    205    203            ?           2606    27676    Class_ Class__user_id_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public."Class_"
    ADD CONSTRAINT "Class__user_id_fkey" FOREIGN KEY (user_id) REFERENCES public."User"(id);
 H   ALTER TABLE ONLY public."Class_" DROP CONSTRAINT "Class__user_id_fkey";
       public          postgres    false    201    3023    205            ?           2606    27736 .   SemesterDetail SemesterDetail_semester_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."SemesterDetail"
    ADD CONSTRAINT "SemesterDetail_semester_id_fkey" FOREIGN KEY (semester_id) REFERENCES public."Semester"(id);
 \   ALTER TABLE ONLY public."SemesterDetail" DROP CONSTRAINT "SemesterDetail_semester_id_fkey";
       public          postgres    false    203    211    3027            ?           2606    27731 -   SemesterDetail SemesterDetail_student_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."SemesterDetail"
    ADD CONSTRAINT "SemesterDetail_student_id_fkey" FOREIGN KEY (student_id) REFERENCES public."Student"(id);
 [   ALTER TABLE ONLY public."SemesterDetail" DROP CONSTRAINT "SemesterDetail_student_id_fkey";
       public          postgres    false    211    3043    209            ?           2606    27706    Student Student_class_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Student"
    ADD CONSTRAINT "Student_class_id_fkey" FOREIGN KEY (class_id) REFERENCES public."Class_"(id);
 K   ALTER TABLE ONLY public."Student" DROP CONSTRAINT "Student_class_id_fkey";
       public          postgres    false    209    3037    205            ?           2606    27716 +   SubjectDetail SubjectDetail_student_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."SubjectDetail"
    ADD CONSTRAINT "SubjectDetail_student_id_fkey" FOREIGN KEY (student_id) REFERENCES public."Student"(id);
 Y   ALTER TABLE ONLY public."SubjectDetail" DROP CONSTRAINT "SubjectDetail_student_id_fkey";
       public          postgres    false    210    3043    209            ?           2606    27721 +   SubjectDetail SubjectDetail_subject_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."SubjectDetail"
    ADD CONSTRAINT "SubjectDetail_subject_id_fkey" FOREIGN KEY (subject_id) REFERENCES public."Subject"(id);
 Y   ALTER TABLE ONLY public."SubjectDetail" DROP CONSTRAINT "SubjectDetail_subject_id_fkey";
       public          postgres    false    207    210    3041            ?           2606    27691     Subject Subject_semester_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Subject"
    ADD CONSTRAINT "Subject_semester_id_fkey" FOREIGN KEY (semester_id) REFERENCES public."Semester"(id);
 N   ALTER TABLE ONLY public."Subject" DROP CONSTRAINT "Subject_semester_id_fkey";
       public          postgres    false    207    203    3027            y   [   x?3?<2????
w?8+x{?;B?.w?S??|??-T??ԑ???????27?0040?DR?{?1R!?p??'v#`???8?9?b???? c*?      w   *   x???  ??w;?w?ø?&?m&??X??k??[?V5?         h  x?U?[??(D???d???????*???~a?$?.?????w~???H?hި<?w??f~-o?<^3??w?=???̼?oNc<???+??]3??g?0??xƸ????d00??qRXy7?3?&?'?????I>?<V&?_??2Īv??!???]??Gƽ˔E????;?]ʺ??\,??????8??ꕏ?ߥ?ό?n??x??N????驊????֓?U??}??fy7o?PYo?2¾w????J?c?]?<&?Vl~?؛K???JM;U (.+????5?|???β????%??Ti#E2i???Sv??d9wR?????????_??.!????>?d??;?p?U?Lk?TM?H?}*?5V0????5 ə?k??3?l?X?q?5R<*Lçf?Fz?n0͝?0M?=q??s??J??֬???	?0?1a!??H?D????2a!??H>???W????????%????1ҝc	<?u?3??ǀgp#?w#??????x????и??	?0??w@?])LQ???۸?r?????-X?Ov9;#E?x_?pg??O?v??v?p?]t?-?\??-X
v1c?v??)???ّI???!?#?j?????Wn&???[*??`??%????,JK?????[^??^????}6=?~?_????]7?o?D?xvf?	^?%`=??Nʊ?(ʍ???<??'??ƬT??<i?('7??p???????CR???+ ?l*??e???XxDۯQ&?"?L???D?̀C?]~?!??ت֜?ƥg3?%)?ܭ)??Y??5?C_?)?????!?f\i??ǭM'Lb(????A?O\WD??PD??	??U`VD?X0??*I?#?]e[e%?u??V???1`?嗁????p??"??qr?P??]^6?????+??G??{?g????c:?//(9??HyqPxPy@???Y??0AAAA??P]?.L\??PY??TV*?-???
?s?8??_??TW?Ս?Fu?զ?1o??Q٨lTv*;???Ne?*i??7j;???N?????S??G??{?g????c??	???????????????PYn?T*???Be??PY??TV*?-???Je??RY??T6*???v+Le??Q٨lT6*;???Ne???ͣ?S٩?Tv*???<?]??)}???"?j1?s?`D?F4A0?`???A4?h??}?9???#?G? A<?x???? @??D?)??B=?D??	"D$?H???V??Q?FE̪? (AP?n}? ,AX??a	??%?p	??%?K? .A\??q?mɣ???|??????[????L????ldf???f?Ih&???&??L"3??<???f??L3??0 3??$2?|d ?Ih&???f??L?C}e?:j?Z:??????P????????\?2?1?qF}??1s?F????а????:??L?3?g&??g??:??L?3??$:??????U??G??{?g????cⲈ?".??,Ⲉ?".??,v?EXaY?.??,???]AYe?EP{?"&????-???Je??RY??T6*???v+Le??Q٨lT6*;???Ne???ͣ?S٩?Tv*???>???%l?s      }   ?  x?uWMkG=?~??C?AX2ZL?lt??A+ރ?????!???M0
		?!d???(??ORU?=?#???
?Vu???^???f?l?٪[???v?A???`?0'???e?ցͮWˋ???7???gL?Hv??V{???U?Ւs?5Wk??=k?;?1?}?sU=??6??9?y?c?bV2S??<????W? ???E?~??N???$?p???xx\m??y6?????????N[?ӞN?8??~zY??n?G??L??y??:?.??|???ã??X?o????N?2??7%????????s?????w?լ?]??Ӧ]??󈼎j*? ??z????V3?;d[߽?$V????.H????@?sQȃ?0U??nd8W"?r???@=~[=?ی??E?y}??HU???x??#??G?U\T?W????&bklA[+?n"\??k?:|??6?,?.???˙U?\???\?????G
}C??#^
?F?&?????	6T(]0??E?'ʶ@??M??v?*?5sL??E̐??>???E	.j?????pN?EV:ǣX???{?Zg5?ٞv?!t??G??ʀS??=???D@?t!1???n?J?j??(?!ȁtT'v???u҆x?1?I???tR?
??Ϳ	?#H?P"#Ոsz?/H??G@?6???*K???<??S9?x?	????n}Y!?FI)?4?? 	XK???????;k	??$'????j??g?#b?SrA?N0*?O??????H??d?E2???!??p?RH?P?tI"??%$?o"5d?X??$??~??diA??8[???"?1N??$ t)8X??`???C?????Dǖ?*???d??x_?E?^?w=?4Aț?|?%?(9??5?+t?p?%????1s??G-;?O?I4}'?u???I?-?`w^??ɓ??V??M?zU?4?2?:>?4k&?.?oAl95G?	_????b#P?????`??pZ!
?W?^h8???%b?u???	???:??@}>?+2h>xC?%?@??F??ˠ??V𫸂ЭqP??əV?|	?)]?,???h?\??/???05_?ҳuK??U
n?m~ζ?H#??????Ta??qY.?x*7?2leD?x?a???hp???	?h;?c?|Mʝ]???s"m????c??8NgG&????C%?E??N???p???A?h?i???kv=(X?!??q1-?1@5 y??Y?FS?d!&Z?{?}00ѿp]rb?k?w/\9h??B?vr
?6*?s?i/??;H6??va?E??*?0s????Y?ORSUH???????0??C?Ğ??3ٞ<Āv???Gs???=?׻?? !???VU"ѿ?/F??)r???????Ց|??wd?ء?{IxH?r??&45?&˳!$.?H%&i?G?j??W??????	ol      {   b  x?uVMo?F=/???B?HQ:?j???? ?^h&	K?j?Fuk?CQ"EQAL?!?B?ԗ?(zXA??	????,)?r}lΛٙ7of?)v?<{d8H&?:?C???V???????ʕ=`????3W??ԓ?~w*?Ba??aR??|,G?6?? ????&l-?8Pi$??٥'?L?l?ɱ?>??#u&?a|?Ж?G*??n???c|?(v-J????Ù?qh?R?????{???[y?'Xb9??[?4:?I?????HENd???Z?vE????r???l????߇?l$???d???F8???rLm0??@?y??on???6K??l 9???-?Prc?1??Qfc??%??4?~??;????_???U?H????
?9⩦B??"??j{GlG??+???????{?Ƀ<{?w???e??????Cb2?dH?"(;?b????"???۪??h????%
x??A-QՅD?y??`?#???`K<#?&ܔ? pˏ\]???r?IxRh5SN>????DB.?y??4?g?El????????G,_1˨t*?d?]㆔??:`G? ?LGwn	?0??(5r?s?h4d??MglHs?f?.?%rM?????Wוc??1^???ȍf???=?#`-p?	?I?c?Oc?<r??[vuP?U?
??2\?)???-?}9?A? ?5?G??[t?????F/"??K?a?z?r`?"???P?Z?Yx???9??????鶚?G?D? ">H&?*? ??[z??????	=B????+r
???S??Ъ????Z_?<???????5?HZ?f??O?
??aYb?wiP???y???6k?f??{+????]??/???G???????C?Y+??g??????jX?~???S?sfvC<˳9/G?j?C?????-R??:ť??r'???m???c??Pj)??Z???7??j?U??γ????qP?lJ?>֢??)ֈ6?v˯?.???U(Gh?H}3???t??jрN-????(ֆ???B?$?H~x???F?!?wN?
?mljѮb?S??6??????}?6l?k?J}@Wi??n9?C?v|T͛U??h'#Mك?)+??T|,w]"?1?v?=??:(n?񃊖??~_?????P?'????????Ֆ<??????]???[???r<???[??#?E="?;M??A|??ŷ??$?Ҥ>N??=?(w?p???????{% ??[?bĎQ??)??᷈?7u??<D??o?"o?*??t͇c?f?:+???z??k?p??Vg}?????y?ԗ <:?^??Rԕ?(???YOZX?1?滸_???mH?N???jb???{? _d?????      ~      x?U?[????????LT>	6????߄??o8&\?_?)u??????O?ڟ???????/??????>?????y???????????>???*???9V?c?)?????{??????????ol?n??????D?v??˿?z??????(?????l????????????^??x??k????6?xYs???|?;?\????FC????V???a?zZg?Xa?X^7?ld??u???$??if?,kfY3??ି?4?Ү٩?QT??FQMS5M????U????h?Э?e)?Vsk5N?qz??k?^?tĩ-??CZm\?t샷??z???r?Y?1??O??????g?<E????)??g?)?????.??b????????G??~s)t????н??B/wM?i?S?c ?Q?oJ?*e?Fe~^?IԽ?)??i^??o?{-q%~?}1^s???#G?_l??Vm?8??̽???2?Z?^??k?{-s?e??̽???2?Z?^??k??(??Q???Q????j???f??A???A??n?Э??jn??i5N?qz??k??8??Ak?z͠c????kn??c???????@b???D_5????<{1???_??ԞW??S??????Y??2?Z?Q?<j?G-?Xe~?2???>c???X????O??)?B?Z?1
???/?9??cx?s~???_j?^?t??V??롭v??C????z???j??Уz?B?Z?Q=j?G-????Уz?B?Z?Q=j?G-????Уz?B?Z?Q=j?G-?????c?Ͽ?V?j5F?1z??k?^ctĨ???3ZmX?t샷??zͭ?s?}?l??=?}*??J?R_??YJ=???5??~???<?B???\???AJ?g-??Ş?س{?b?Q??s>?????????˻Ğ??6???oý?:O?????/j????k?^st????끭6?ꡟB_??2?Z?Y?<k?g-??e??̳?y?2?Z?Y?<k?g-??e??̳?y?2?Z?Y?<k?g-??e??̳?y?2?Z?Y?<??y?R?Z?YK=k?g-?????Գ?z?R?Z?YK=k?g-?????Գ??ʉ?f???a????????o?o?o?M??D??*??J?5?F?߳?T?\??U?\??U?\?̵>?m??F????f???????h?w ??k???[{?Qߔg8T-z???s???ל9?𫨇??Vm??^7j??ɺO?}??D???5???e?-k?U3???<??W-|???(????SMQ5?jl?ح?n??????C??N??U?^??U?^??U?^??U?^??U?^??U?^??U?^??U?????u???i??????ʧ{??翶?a??	|???5???~~???ؿ?s)?V˽?ro??[-?V˽?Ou?Y??6
}?5??s7?|Oo_??z??F?????????z??)??)^s???#G??^m??Vm????jy?Zޭ?w???jy?Zޭ?w???jy?Zޭ?w???jy?Zޭ~??Z??x???'{?E?j??Z??y?E?j??Z??y????y?E?j??Z??y?E?j??Z??y?E?j??Z??y?E?j??Z?}~??k??gW??????????Yo?]K?ϻƈ۟2_???5>?ƻ?wF?^???"???{-?^???"?????p|???fm??^??V7j?˧y?^6j?^?????l٢???zh?????p??Y?k??Z??{???k??Z??{???k??Z??{???k??Z??{???k??Z??{???k??Z??{???k??Z??{??{>?Ɵr?????(?F?5J?Q:??v???6??:???jn??VJ?*'?׼????ڥ~?[m?8?????????u>կyY???????4?Jǿ?O?????Z?W-???U???O???d????????Ɵk{?V????W-?k??????i?|?q~S?yl?z?Б!ڋ???????O??t?5?R?W-???U???E~?"?j?_?ȯZ?W-???U???E~?"?j?_?ȯZ?W-???U???E~?"?j?_?ȯZ?W?D?j?_?̯Z?W-????U???e~?2?j?_?̯Z?W-????U???e~?2?g??"}?;?b+N???????J?gm?????=??k???7??w?_7??Z?w-????]K??%~??G??????ٗ?S?o?^[??S???ן?+??(????E~?o??m????,Y????zh?`?І??Q?/?~?B?k?ߵ??Z?w-???]???~?B?k?ߵ??Z?w-???]???~?B?k?ߵ??Z?w-???]???~?B_??]???e~?2?k?ߵ??Z?w-????]???e~?2?k?ߵ??Z?w-????S????y???[?<??????x???9???7n?=o??-????h~??h|M??U???g~?3? ?_???u?!?e?????????e???gK?7??^??^???_??u??qd[???C?????a?W???xƀ?*??b??댺????/?_r?d??3?g?'y&zB?E?E?'??	YY???4?ҐKC??y6???!^G??x?:??????ڎ\:??;?gG?uȰyj0]??zS?Y?cg6N[??C??3[?N?ק???k?]?f?3d?Qܑ?????;?????+?Fz????T???"??^?a??5|t`???3?;??F?G?g>?(?H?h?&?;Õa? ȣ?#ɣ?#ʣ?#ˣ?#̣?#ͣ?#Σ?3z$z4zDzTzdztz?z?z?z?z?z???\?^?`?b?d?f?h?j?l?n?p?r?t?v?xz?ߛ?r?????u ?o ?s?p^????.I?C?y?w???!?|?g?|?g?|?g????hB?3_???y=??5????!??-??5????y?????D??;rw????/	?3?)?>5??a˱u+-?_b??~?9?e"?D?$?L􃐋??O?'???rrriȥ!???lȳ!^C??x?:?u?C?;????t??w"ώ<?2`????CH?/%???nŁVu?,?=??@????0??f??w?&hp?(h??*h????`?? ?"?X7O&??c???9??X)O???Ƕ?ő??????4?A?~?t????KBC?"\4????$??,?4??<?D??L??"??P?&D?	99???4d??+"4?ِgC??x?:?u?댇?wFGk;r?܏?D?y?d??=j??{#??@?:??V١-w??M}}?g=?y2?????@ ??@?Ѐ?????a??c?Ӛ???F???N?s????q????on?w^1)?i?#??%"?@&р*??.?r??????Öc+?V"Zb??~???s"?D??~H???!!!?O?'d-d-?"?"?ҐKC."4?ِgC??x?:?u?댇?wFGk;r?܏?D?y??C??????M?V????	?z??y?1/.j?#i?p?n¸???a~?5V`F?f4pF?g4?F?h4?//???.??Y??????h??7???c?//??7??\q?????? oG?μ???????1D??)?ۖ:t@7x??7??A8???8??A9???9??A:????B<!?O?Z?Z?E?Eȥ!??\"4Dhȳ!φx?:?u????m?v?ҹ߉<;??C??????<??!?M}???C?????? ??!??"?ƍ??w:Z?_4?H??4?H??4?H????#????Zhk??G?????y?a+}?U????7???c?'?f?6???;??#g??????C????tr???:i??<iГ>i??@i?Bi0?DiP?Fip?Hi??Ji??LiДNi??Pi?Ri0?TiP?Vip?Xi??Zi??\iЕ^i??`i?bi0?6??.?~?????u?o??????????߳???d??+w3??L?[???[??\ĥ?5t?t?۴??q?u???-/??t??߼???????l!?9l?9
rw??̝?Qz?p|C?̯+?n1{ư??ԁ? 1?@1Ӏ1??1? 2"?@2&Ӏ2*??2.? 32?@36Ӏ3:??3?/???wאeC??h?:?uD댆?w?QC[;r?܏?D?y?    a?:OQ?U?F??????\z??Cq???kZo?޳????}????{Q??M?4?M?4?M?p?|??vs????>?a׺@?V[??ƽ_?s?k???.$?]4?9???9?? :??`:?¹Ƶ???ofu???4?N??4?N??4?N??4 O??4O??4 O????<??%8O?4HO?4XO?4hO?4xO?4?O?4?O?4?O?4?O?4?O?4?O?4?O?4?O 5P5P??????Y?Y????{^??zy??=????????????dP??z?a?1?0?A?8???@?A?ڽ???s?_X?r??~??M?????k?ۅڄ??+d??ϑ?#Sg?l=8??/?-?k??=a?rlE?JDK???/?rNd??2??<? ?"?"??	񄬅??\?\?\riȥ!BC??<?l???#^G??x??????hmG.????ȳ#?:'ӯ?Q?N7???H???<u7D?hߛz=?z̧$????]?tXR?%uXR?%uXR?%??:?8ٝ)????[?F?j??0?O??W?9???;?髖+}????\u?R?+u?R?+u?R?+u?R?-v??o[???[?x???%?C։<y&z"?g?'?\?\?xB<!??????????KC.?4Dh????,?ԡJ?ԡJ?ԡJ?ԡJ?ԡJ?ԡJ?ԡJ?ԡJ???n箊?S8??gHg?}?tΠ??????-??r|??j??0??p?R?)u?R?)u?R?)?mJ???3?ng?7?n????1??????ԋ%u[D?샬Ǡ??GƎ????K??}2)z{???'?-????K갤K갤K갤K갤K갤K갤K갤K갤K갤K갤K갤K갤K갤K갤K갤K갤K갤K갤K갤K??	??????AcV?????}W?mx???c??{z??=??8?{?,??sN
?Y!9-$???Đ?rM?f????T?rƱ%??b?8????S??oܧ\???&徆??VG??|c?qd??ڙ5{????/??t?!uN?#9e$??䤑?5??Fr?HNə#9u$???䑜=??Gr?HN ?$9?$???$??E??HrIN$ə$9?$???d??M??Ir>IN(?%9?$??䤒?U??Jr^IN,ə%9?$?OC?/??R?z7?K?^g?e?e?	jƴ.?{????]?G??£NR??A??A??A??nң|])~????m?ܿG?=?]?x?7G?5E?Ǻ@z?w???!H=????;2wf???/?7??!???}eU??Q?u?Q?u?Q?u?Q?u?Q?u?Q?u?QǤ?A??A??A??A??A??A????ʽ??l???#ZG??h?????>jhkG.????ȳ#?:x?`?s???H~CG?????G=Ϥ???R?sK??a???X?q?b?? 0?u?Q?u?Q?u?Q???%???󎬏?y??#?3,?Yx߂??#????y?ַ??]??L??У=?У=?У=?У??JG?v?g[???[?x???%?C։<y&z"?g?'?\?\?xB<!??????????KC.?4Dh?АgC???u?????3????ȥs??yv?Y?M6/?|~??~iz?ר???C????=a??܎?aG?7??͟v;갣;갣;?{:?}?Ee?P?¢5?ƽ[?{s??G?ظ&???>???;+5?z??8̨Ì:̨Ì:̨Ì:̨Ì:??t?Q?u?Q?u?Q?u?Q?u?Q?u?Q?u?Q?u?Q?u?Q?u?Q?u?Q?u?Q?u?Q?u?Q?u?Q?u?Q?u?Q?u?Q?u?Q?u?Q?u?Q?u?Q??vw?5?????????????@?{???-X_?h?7?;????Q?sxQ?uxQ?uxQ????u???7-??2X?????oV|/?j???_?????????V?2 ER?!ER?!ER?!E?-?5??h40ͦC?:??C?:??C?:??C?:??C?:??C?:??C?:??C?:??C?:??C?:??C?:??C?:??C?:??C?:??C?:??C?:??C?:??C?:??C?:??C?:??C?:??C??Ԣ㏽?I???????i??;d|N??D滌z???{??ו????Т-?Т-?Т޿Yx??s??E????n??kظ??V??Rԯq?t?=??}{?\р??DO?9;rv??~?/?b?0?i???!N??DN??DN??DN??DN??DN??DN??Z8??ߞM?&Drr222iȤ?W"4Dhȳ!φx?:?u????m?v?ҹ߉<;????]Ӹ??h???|?????????Z???߯5kfϾ^?4?????U?'?p?'?p?'?p????vW?z?zƵ?5?ּg˾v?{?????~??)?1???7`EV?aEV?aEV?aE?Z?4N???1l9?ОD??~????!?D??<=??3?B.B.B<!?O?Z?Z?E?Eȥ!??\"4Dh??FC???uD????3Z??Gm?ȥs??yv?Y??=۸'1?g??7x???]/??????L????E?J??s?~??+??/???/???/?7????S*~?q?s???gH??h?Ӌ??/ó?>???y?a?;9ϳ?????ّ?3g?9?`?C?{Ű?؊?????/?_r?d??3?g?'y&zB??,?ᐣ9ꐣ9ꐣ9ꐣ9ꐣ9ꐣ9ꐣ9ꐣ9ꐣ9ꐣ9ꐣ9ꐣ9ꐣ9ꐣ9ꐣ1??;?F????!/?)~??z?cn?=???,0?ZK????o?A???f4`Ff4`Ff4`F??????a?(b4~?	?8m??K??[?~W]?^4~?
G?# ??4l???h???h???h?????, Fb4 Fb4 Fb4 Fb4 Fb4 Fb4 Fb4 Fb4 Fb4 Fb4 Fb4 Fb4 Fb4 Fb40i???h???h???h???h???h???h???h???hX?_??謿׌??Ņ¾???n׷?wS???Q?????p?7p?7p?7V??DY<? ????i?kY??Ѱu???>?F??c???hL;????h@??h@??h@??h`Y???р?р?р?р?р?р?р??G
?р?р?р?р?р?р[?????ѐgC??x?:?u?댇?w?RCk;r?܏?D?y֡?????j??????ƚ?t~?x??%??W??I???Gx????;??;??;???g!?W???c?a_?<?V?Y?b??Ӿz?1?h<??-??#VG?s0?GC??̝??7?+BC?"?ư?????4 H?4 H?4 H?4 H?4 H?4 H?4 H?4 H?4 H?4 H?4 H?4 H?4 H?4 H?4 H?4 H?4 H?4 H?4 H?4 H??????Ȉ?B???r?(?s??/??.K?Hו??I??????Ï?|??7ÜUʹL9?)?B?\??K?s???GǤ????`#??k?ع9?????1'?3?r?4b?x?.\u-????\????s?r._??˹?y?K;??9?1?:?\Ȝ+?s)s?e??̹?9?3?z?\М+?sIs?i?E͹?9?5???\؜+?sis?m??͹?9?7??昀4??9?9?:?\??+?s?s?u??ι?9?;?z?\??+?s?s?y@y???????yX6?? ?}o???l̩Gר?&?????c??????>??>࣑??????(3?F?+?^?<w?ߛ??8??3?~????v4r]??W??Gz4?Gz4?Gz4?G#?ؑo<c??Т:v@??h@??h@??h@??h@??h@??h@??h@??h@??h@??h@??h@??h?G?v4`Gv4`Gv4`Gv4`Gv4`Gv4`Gv4`Gv4`G?.?:???7?h??????k	??VB?9?y?c??s?q#d\???@߼C0?1???n??i???6??ڋ???s??r??z?6Tg?I}N???p?I???4i@?4i@?4i@?4i@??Ԥ{?%XҀ%XҀ%XҀ%XҀ%XҀ%XҀ%X    Ҁ%XҀ%XҀ%XҀ%XҀ%XҀ%XҀ%XҀ%XҀ%XҀ%XҀ%XҀ%XҀ%XҀ%XҀ%X?hGyD+???7i?2??(?o i?Z????:ҹ?2]?\??7??!?4 K?4 K?4 K?}??D+W>0i?u?V?]???hk9M?`??Ƶ?N`p?W?{n6?J?4?J?4?J?4?J?}K?\i??\i??\i??\i??\i??\i??\i??\i??\i??\i??\i??\i??\i??\i??F[N?_yC???u?????3???K??ȥs??yv?Y?~?]??]?xei???⛃4zQ1g!??~o????i??F??8 K?4 K?4 K?4:?=?-?bKc??X͙?ퟟW??F_?z5?G??:??7k?K?4?K?4?K?4?Kc?B?31??a??ti@?ti@?ti@?ti@?ti@?ti`Ҁ/?Ҁ/?Ҁ/?Ҁ/?Ҁ/?Ҁ/?Ҁ/?Ҁ/?Ҁ/?Ҁ/?Ҁ/?Ҁ/?Ҁ/?Ҁ/?Ҁ/?kS;\??Qg!?9?? p}??U?:?y????V]????X?tȚD<?L?4?L?4?o????Y?YH>?\?k??3????Ym%?-U?????x??]?>˵_#?y???sd??ؙ1{??D0??!???vՁ?4 K?4 K?4 K?4 K?4 K?4 K?4????=1?Ҁ,?Ҁ,?Ҁ,?Ҁ,?Ҁ,?Ҁ,?B??[??[??[??[??[??[??[??[w??#?<?׻q?y_?ޟ????Hu??ϻ?kM?}??.?Ǎ[???[??[??[?:?M!?D7n???̣???t7?<l?@?w?őwy?%?K?4?K?4?K?4?Kc??=d??|i??|i??|i??|i??|i??|i??|i???&Ӏ0Ӏ0Ӏ0Ӏ0Ӏ0Ӏ0Ӏ0Ӏ0Ӏ0Ӏ0Ӏ0Ӏ0Ӏ0Ӏ0Ӝk?ϓ????"???Y׸?:3i?K???1??3??\?~?H9?i?q?sn??~?4?L?4?L?4?L???????#?J??[w\Ns?s?????䚕??{"?u	7?2?[??????4aL?4aL?4aL?4?z???Oc??[Q???%?Ky&?L?D"?DO????xB<!k!k!!!??\ri???!φ<?5?????#^g<??3:ZۑK?~|'??ȳV?????G??4?<???2M??U?1?z??~?}iɩL????????4aL?4aL?4aL??5?,?4???i?,a?}??_?w?s??/?9t?S??0MӴu???ߐ?#og???r??3????Oc??[Q???%?KY&?L?C"?D??ȾߔM?&Drr222iȤ?W"4Dhȳ!φx?:?u????m?v?ҹ߉<;???0???/??@~?&M??f??>?k??y?"?L0?^?X???4?K?4?K?4?Ks?Һ?5?#=?????u?=?{,.?????u?L|?=W=?4???8!K?4!K?4!K?4!K??n?p?	W?p?	W?p?	W?p?	W?p?	W?p?	W?p?	W?p?	W?p?	W?p?	W?p?	W?p?	W?p?	W?p?	W?p?	W?p?	W?p?	W?p?	W?p?	W?p?	W?p?	W?p?	W?p??\????4}]??וf?uu??y?t?ƹ=?qV^?)K?R???	Y???	Y???	Y????Ԃ??Ȩ?9r?J?????=e????T?q?<??3??.9?'$Pi??H?4AJ?4AJ?4AJ?41i??&Hi??&Hi??&Hi??&Hi??&Hi??&Hi??&Hi??&Hi??&Hi??&Hi??&Hi??&Hi??&Hi??&Hi??&Hi??&Hi??&Hi??&Hi??&Hi??&Hi??&Hi??&Hi??f??+?gʟ?r%?<???Azf????????\	?,+?e?kg?:p ?&Pi?&Pi?f~?W2?gi3?ה\O???s??I?7zf??#???'??ޑP??g$??>d??ڙ5{????/??????Q??	Q??	Q??	Q??	Q??	Q??	Q????,a??	Q??	Q??	Q??	Q??	Q??	Q???4aJ?4aJ?4aJ?4aJ?4aJ?4aJ?4aJ?4aJ?4?)]????<mP:????o???T=?Й=?*=?Y?*?$97??a?????413iB?&TiB??T?×?????i??V`I??YR?S?9M???-??k=??d<??{??u??̗}?_?o?C?9l????K???	K???	K???	K???	K???	K???	K???	K???	K???	K???	K???	K???	K???9-??:jȱ!VC??X?:bu?B?;z????t??w"ώ<??1?*?vf?vn?f{?*Hsҳۚ?8[?`0?J????????:X??&?h&?h???9?t???nJ??4?.????o$g[O?ݫ酁e{??L?_???ٖ?8?sd??ڙ5{??D0?˼???U???R??фM?фM?фM?фM?фM?фM?фM?фM?фM?фM?фM?фͶ?x???SC???uD????3Z??Gm?ȥs??yv?Y?~&2?~&2?o?쓞?o???2??|?,???1???z?ģ???q$?h?&?h?&?h?f??f/?F????????Q?B??????Da???o?Ⱦ?!M?!M?!M?!;?Ş??ǰ?؊?????/?_r?d??3?g?'y&zB?E?E?'??	YY???4?ҐKC????+AH?4AH?4AH?4AH?4AH?4AH?4AH?4AH?4!?d?"???Ҽ??'5?C?y?}?S?U?|˫<???i?7ýp3?H?4?H?4?H?4?:-z^?A?I?*7U6$??ھS?IIK?_?˄a	L?{??Ǒ?#kg??	??p|C?|7V0Ei?& i?& i?& i?& i?& i?& i?& ib??$M@?$M@?$M@?$M@?$M@?$M@Ҝ??`@?$M@?$M@?$M@?$M@?$M@?$M@?$M@?$?????u9??iNF??u?Ҽ?o.wY?:??bd?e???}~3?;9W?& i?& i?& i??抭??7W?H?,h?gA?<??Z??????2??>7͉G??*?h??&?h??&?h??&?h޸?:???	:???	:???	:???	:???	:???	:???	:???	:???	:???	:???	:???	:???	:???	:???	:???	:???	:???	:???	:???	:???	:???	:????+?C/???/??-4?_?sT??uE??R?~?JM?? F0*?Q?j??5??W???Ԥ????ƅm2?N???o?>e?&M6??W?????@F5?h=2wd?̜??_"??????4*?Q?
hT@?Ш?F4*?Q?
hT@?Ш?F4*?Q?
hT@?Ш?F4*?Q?
hT@?Ш?F4*?Q?
hT@?Ш?F4*?Q?
hT6?????Zdt]ߔ?/+?󰬾%?eg!??I?7nYQ?sr?w?Y?E?m?!???? G8????Nt?kh?ѓs??GVo?h?QCĂ????z׻ԛ?~Mبl]%=??ڑ?3k?=?`?맅?Öc+?V"Vb??~???q"?D??^H???!?_?4*?Q?
hT@?Ш?F4*?Q?
hT@?Ш?F4*?Q?
hT@?Ш?F4*?Q?
hT@?ht?|??5R???"??c??Te??9l?????+???#֮?w?ʛ?/?C???? G8*?Qy?L*???W74??zNM?.??w?5??????Xa{?????$?QM4?9;rv??~???7??!?\?I+v6?F6*?Q??
lT`?ب?F6*?Q??
lT`?ب?F6*?Q??
lT`?ب?F6*?Q??
lT`?ب?F6*?Q??
lT`?ب?F6*?Q????#?9G?}W|?-i??????G???}?an?+???G>*?Q??j?Ѿ???(?ז?f?Q?;,ڄ???ܝU,?3?Ϻ]?y????@HB*R??
?T ?! ?  U|?G@* R?
?T ?  ? H@* R?
?T ?  ? H@* R?
?T ?  ? H@* R?
?T ?  ? H@* R?
?T ?  ? H@* R?
?T ??2????s?{?c?J???3t,B???T????????!͹???8?\ ? ???????G>??????=?X?ٿ??k???^?~???~?|??vN?~??0???{$G?et?
pT???? G8*?Qm8???ሎ??[?h???%?CΉ,Y&?L?C??\?\?xB<!??????????KC.?4Dh??ދ?ب?F6*?Q??
lT`?ب?F6*?Q??
lT`?Z?؏?ݥ:\|S?j??qSA:?b??L?4oĞ?_?{?3??&??????E,*`Q?jb?}?s?UgRM*Z?=???_)??׵?_f>?????????E??Iz??
\T?????E.*pQM.????x???[?X???%?CƉ9&rL?B??\?\?xB<!??????????KC.?4Dh?АgC???u?????3????ȥs??yv?Y???????5?h???I;K??]?^mڍ????۹??V?U+g@?Ш?F4*?Q??Ť??J;?Z?????%Z?l?D??Gm??q???,?6|ˑu=? Ш?F4*?Q?
hT?..+?Q??
lT`?ب?F6*?Q??
lT`?ب?F6*?Q??
lT`?ب?F6*?Q??
lT`??b??? G8*?Q?
pT???? G8*?Q?
pT????*#????;?????K?^??5?^o??yI?Z?????N?o????? G9*?QA?
rT?[?Ie?Q??6??]??E?<?}?{?}^??G???
jT[???pd??ܙ9{??D0??!??SEfT0??̨`F3*?Q??
fT0??̨`F3*?Q??
fT0??̨`F3*?Q??
fT0??&Ԩ?F5*?QA?
jTP??Ԩ?F5*?QA?
jTP???U/?^??#ߍRt?~`E?we??3??ׁ?Zbt??????-F?S??QA?
bT???^޾????t???z`??\7?҅?W??G׋?4??>????=+hQA?
ZTТ????Eu??{?=hQA?
ZTТ????E-*hQA?
ZTТ????E-*hQA?
ZTТ????E-*hQA?
ZTТ´?????E-*hQA?
ZTТ????E-*hQA?
ZTТZt????I?????G?YR?^dE????<?w?z?	?l??0????`D#??\????????s?qkQ?^E?]/??ui??bh?-?<???GGƎ??????}b?`??????`E+*XQ??
VT?????`E+*XQ??
VT?????`E+*XQ??
VT?????`E+*XQ??
VT?????`E+*XQ??
VT?????`E+?>+ږ]?Ę??n?\???yF??%eۯ???-h??D?sN???N?ՠF?h?mP?j?A??ߚ??Z???(????[?^m??dS??????????nb??????7d??ڙ5{??D0???ύ?b?B{??? F?h?m?b?A?6??1? F?h?m?b?A?6??1? F?h?m?b?A?6??1? F?h?m?b?A?6??1? F?h?m?b?A?6??1? F???????%??      u   O   x?3?,)M????,H,..?/J?H,?HM??K/?|??5O!?Hs??c^?BH??]K?8??A:??s3s???s?b???? (??     