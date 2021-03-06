# frozen_string_literal: true

users = User.create!([

                       { email: 'bogdan@example.com' },
                       { email: 'grigory@example.com' },
                       { email: 'igor@example.com' }

                     ])

categories = Category.create!([

                                { body: 'Ruby Programming' },
                                { body: 'C++ Programming' }

                              ])

tests = Test.create!([

                       { title: 'Initialization', level: 3, author_id: users[2], category_id: categories[0] },
                       { title: 'Pointers', level: 2, author_id: users[0], category_id: categories[1] },
                       { title: 'Ruby Basics', level: 1, author_id: users[1], category_id: categories[0] }

                     ])

questions = Question.create!([

                               { title: 'How to announce pointer of int x?', test_id: tests[1] },
                               { title: 'How to initialize a variable named m with value 5?', test_id: tests[0] },
                               { title: "How to print a massive called 'A' in line?", test_id: tests[2] }

                             ])

Answer.create!([

                 { title: "int x;\nint *p = &x;", question_id: questions[0] },
                 { title: 'm = 5', question_id: questions[1] },
                 { title: 'print A', question_id: questions[2] }

               ])
