import 'package:zenmoney/features/quiz/data/answer.dart';
import 'package:zenmoney/features/quiz/data/author.dart';
import 'package:zenmoney/features/quiz/data/entry.dart';

class Question extends Entry {
  final List<Entry> answers;

  Question({
    required super.content,
    required super.author,
    required super.date,
    required this.answers,
  });

  static final List<Question> questionList1 = [
    Question(
      content:
          'How do you rate the overall convenience of using the mobile banking application for conducting financial transactions?',
      author: Author.authorList[0],
      date: '23 Apr, 2024',
      answers: [
        Answer(
          content:
              'I rate the convenience of using the application as high due to its intuitive interface and fast navigation.',
          author: Author.authorList[1],
          date: '23 Apr, 2024',
        ),
        Answer(
          content:
              'The overall convenience is good, but I would like to have more personalized features tailored to my needs.',
          author: Author.authorList[2],
          date: '23 Apr, 2024',
        ),
        Answer(
          content:
              'The convenience of using the application is generally satisfactory, but could be improved to optimize the process of conducting operations.',
          author: Author.authorList[3],
          date: '23 Apr, 2024',
        ),
      ],
    ),
    Question(
      content:
          'Are there any features or operations that you find inconvenient or in need of improvement in the mobile application?',
      author: Author.authorList[1],
      date: '15 Apr, 2024',
      answers: [
        Answer(
          content:
              'Some features, such as setting up recurring payments, require too many steps to configure.',
          author: Author.authorList[2],
          date: '15 Apr, 2024',
        ),
        Answer(
          content:
              'Currency conversion operations between accounts are challenging due to unclear exchange rates.',
          author: Author.authorList[3],
          date: '15 Apr, 2024',
        ),
        Answer(
          content:
              'The ability to scan and add checks in the application does not always work reliably and requires improvements.',
          author: Author.authorList[4],
          date: '15 Apr, 2024',
        ),
      ],
    ),
    Question(
      content:
          'What is your opinion on the authentication process and security in the mobile application?',
      author: Author.authorList[2],
      date: '5 Feb, 2024',
      answers: [
        Answer(
          content:
              'The authentication process and security in the application are quite satisfactory and inspire confidence.',
          author: Author.authorList[3],
          date: '5 Feb, 2024',
        ),
        Answer(
          content:
              'User authentication could be more convenient, possibly using biometric data.',
          author: Author.authorList[4],
          date: '5 Feb, 2024',
        ),
        Answer(
          content:
              'Adding additional authentication methods, such as two-factor authentication, would enhance the level of security.',
          author: Author.authorList[0],
          date: '5 Feb, 2024',
        ),
      ],
    ),
    Question(
      content:
          'How do you rate the time it takes to perform basic operations in the application, such as transfers, bill payments, and account management?',
      author: Author.authorList[3],
      date: '25 Jan, 2024',
      answers: [
        Answer(
          content:
              'The time it takes to perform operations in the application is quite satisfactory and meets my expectations.',
          author: Author.authorList[4],
          date: '25 Jan, 2024',
        ),
        Answer(
          content:
              'Transfers between accounts could be executed more quickly for user convenience.',
          author: Author.authorList[0],
          date: '25 Jan, 2024',
        ),
        Answer(
          content:
              'The overall time it takes to perform operations is acceptable, although processing payments between different banks requires improvement.',
          author: Author.authorList[1],
          date: '25 Jan, 2024',
        ),
      ],
    ),
    Question(
      content:
          'What additional features or improvements would you like to see in the mobile banking application to enhance its convenience of use?',
      author: Author.authorList[4],
      date: '17 Jan, 2024',
      answers: [
        Answer(
          content:
              'I would like to see more intuitive analytical tools for tracking financial goals and expenses.',
          author: Author.authorList[0],
          date: '17 Jan, 2024',
        ),
        Answer(
          content:
              'Adding the ability to view and pay bills from a photo would make account management even more convenient.',
          author: Author.authorList[1],
          date: '17 Jan, 2024',
        ),
        Answer(
          content:
              'Expanding the options for setting transaction alerts and notifications would increase control and convenience of use.',
          author: Author.authorList[2],
          date: '17 Jan, 2024',
        ),
      ],
    ),
  ];
  static final List<Question> questionList2 = [
    Question(
      content:
          'What additional features or services would you like to see in your bank\'s mobile application?',
      author: Author.authorList[2],
      date: '23 Apr, 2024',
      answers: [
        Answer(
          content:
              'The ability to manage personal investments and securities portfolio directly through the application.',
          author: Author.authorList[3],
          date: '23 Apr, 2024',
        ),
        Answer(
          content:
              'The option to connect and manage additional financial products such as insurance or retirement planning.',
          author: Author.authorList[4],
          date: '23 Apr, 2024',
        ),
        Answer(
          content:
              'Integration with budgeting systems and expense tracking for better financial control.',
          author: Author.authorList[0],
          date: '23 Apr, 2024',
        ),
      ],
    ),
    Question(
      content:
          'Do you feel that the mobile application fully meets your needs for financial management, or is there something you feel is lacking?',
      author: Author.authorList[3],
      date: '15 Apr, 2024',
      answers: [
        Answer(
          content:
              'The application more than satisfies my needs, but adding support for cryptocurrency investments would be fantastic. ',
          author: Author.authorList[4],
          date: '15 Apr, 2024',
        ),
        Answer(
          content:
              'The core functionality is good, but built-in tools for budget planning and tracking are missing.',
          author: Author.authorList[0],
          date: '15 Apr, 2024',
        ),
        Answer(
          content:
              'The mobile application largely meets my needs, but enhanced analysis capabilities for income and expenses would be useful.',
          author: Author.authorList[1],
          date: '15 Apr, 2024',
        ),
      ],
    ),
    Question(
      content:
          'How would you feel about adding functionality for investment management or financial goals to the application?',
      author: Author.authorList[4],
      date: '5 Feb, 2024',
      answers: [
        Answer(
          content:
              'I definitely welcome the ability to manage investments and set financial goals directly through the mobile application.',
          author: Author.authorList[0],
          date: '5 Feb, 2024',
        ),
        Answer(
          content:
              'Adding functionality for automatic investment of surplus funds into investment goals would be great.',
          author: Author.authorList[1],
          date: '5 Feb, 2024',
        ),
        Answer(
          content:
              'I believe that integrating with investment platforms and tools for investment planning would make the application more comprehensive.',
          author: Author.authorList[2],
          date: '5 Feb, 2024',
        ),
      ],
    ),
    Question(
      content:
          'Are there any aspects of the mobile banking application that could be improved to increase your interest or engagement?',
      author: Author.authorList[0],
      date: '25 Jan, 2024',
      answers: [
        Answer(
          content:
              'It would be great if the application provided more personalized financial recommendations and advice based on my spending and goals.',
          author: Author.authorList[1],
          date: '25 Jan, 2024',
        ),
        Answer(
          content:
              'Adding financial courses or articles would make the application more appealing and informative.',
          author: Author.authorList[2],
          date: '25 Jan, 2024',
        ),
        Answer(
          content:
              'Increased interactivity and the ability to participate in financial literacy games could significantly enhance the user experience.',
          author: Author.authorList[3],
          date: '25 Jan, 2024',
        ),
      ],
    ),
    Question(
      content:
          'What changes or enhancements in the application could make your experience of using it more convenient or enjoyable?',
      author: Author.authorList[1],
      date: '17 Jan, 2024',
      answers: [
        Answer(
          content:
              'I would like to see improved tools for analyzing my financial transactions and transparent reports on expenses and incomes.',
          author: Author.authorList[2],
          date: '17 Jan, 2024',
        ),
        Answer(
          content:
              'Adding functionality for quick creation of investment portfolios and tracking their performance could make using the application more convenient.',
          author: Author.authorList[3],
          date: '17 Jan, 2024',
        ),
        Answer(
          content:
              'Improving the interface and adding personalized notifications about my financial assets would make my experience of using the application more convenient and enjoyable.',
          author: Author.authorList[4],
          date: '17 Jan, 2024',
        ),
      ],
    ),
  ];
}
