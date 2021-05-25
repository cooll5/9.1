#include <iostream>
#include <string>
#include <ctime>
using namespace std;
//b)
enum  speciality { KN, IN, ME, FI, TTI };
string specialityname[] = { "KN", "IN", "ME", "FI", "TTI" };
struct studentinfo
{
    string LastName;
    int course;
    int Prysicsmark, Mathmark;
    speciality Speciality;
    union
    {
        int programming, numericmethods, pedagogic;
    } thirdsubject;
};
speciality input(int choice)
{
    speciality output;
    switch (choice)
    {
        case 0: {  output = KN;  break; }
        case 1: {  output = IN; break;  }
        case 2: {  output = ME;  break; }
        case 3: {  output = FI;  break; }
        case 4: {  output = TTI; break; }
        default: {  output = KN; break;  }
    }
    return output;
}
void AutoFillInfo(studentinfo* students, const int size)
{
    for (size_t i = 0; i < size; i++)
    {
        cout << "Enter the last name of the student number " << i << " :";
        students[i].LastName = "Ivanov";
        students[i].course = rand() % 4 + 1;
        students[i].Prysicsmark = rand() % 4 + 2;
        students[i].Mathmark = rand() % 4 + 2;
        cout << "the course of the student  is " << students[i].course; cout << endl;
        cout << "the mark in Physics is " << students[i].Prysicsmark;   cout << endl;
        cout << "the mark in Maths is " << students[i].Mathmark;       cout << endl;
        students[i].Speciality = input(rand() % 5);
        cout << "the speciality is " << specialityname[students[i].Speciality];;             cout << endl;
        switch (students[i].Speciality)
        {
            case KN: {
                students[i].thirdsubject.programming = rand() % 4 + 2;
                cout << "the mark in the third subject is " << students[i].thirdsubject.programming;             cout << endl;
                break;
            }
            case IN: {
                students[i].thirdsubject.numericmethods = rand() % 4 + 2;
                cout << "the mark in the third subject is " << students[i].thirdsubject.numericmethods;              cout << endl;
                break;
            }
            default: {
                students[i].thirdsubject.pedagogic = rand() % 4 + 2;
                cout << "the mark in the third subject is " << students[i].thirdsubject.pedagogic;           cout << endl;
                break;
            }
        }

    }
}
void UserFillInfo(studentinfo* students, const int size)
{
    for (size_t i = 0; i < size; i++)
    {
        cout << "Enter the last name of the student number " << i << " :";
        cin >> students[i].LastName;
        cout << "the course of the student  is "; cin >> students[i].course;
        cout << "the mark in Physics is "; cin >> students[i].Prysicsmark;
        cout << "the mark in Maths is "; cin >> students[i].Mathmark;
        int choice;
        cout << "the speciality is "; cin >> choice;
        students[i].Speciality = input(choice);
        switch (students[i].Speciality)
        {
            case KN: {
                cout << "the mark in the third subject is "; cin >> students[i].thirdsubject.programming;
                break;
            }
            case IN: {
                cout << "the mark in the third subject is "; cin >> students[i].thirdsubject.numericmethods;
                break;
            }
            default: {
                cout << "the mark in the third subject is "; cin >> students[i].thirdsubject.pedagogic;

                break;
            }
        }
    }
}
void Print(studentinfo* students, const int size)
{
    cout << "№\t|LN\t|Course\t|Speciality\t|Ph\t|ThirdSubj|Maths" << endl;
    for (size_t i = 0; i < size; i++)
    {
        cout << i << "\t|" << students[i].LastName << "\t|" << students[i].course <<
             "\t|    " << specialityname[students[i].Speciality] << "  \t|" << students[i].Prysicsmark <<
             "\t|";
        switch (students[i].Speciality)
        {
            case KN:
            {
                cout << students[i].thirdsubject.programming; break; }
            case IN:
            {cout << students[i].thirdsubject.numericmethods; break;
            }
            default: {
                cout << students[i].thirdsubject.pedagogic;
                break;
            }
        }
        cout << "\t|" << students[i].Mathmark << endl;
    }
}
void Task1(studentinfo* students, int size)
{
    int k = 0;
    for (size_t i = 0; i < size; i++)
    {
        if (students[i].Mathmark == 5 && (students[i].thirdsubject.numericmethods==5 || students[i].thirdsubject.pedagogic==5|| students[i].thirdsubject.programming ==5) && students[i].Prysicsmark == 5)
            k++;
    }
    cout << k << " students are studying well." << endl;
}
void Task2(studentinfo* students, const int size)
{

    int counter = 0;
    for (size_t i = 0; i < size; i++)
        if (students[i].Prysicsmark == 5)
            ++counter;

    cout << "Percentage of student who are cons in Physics: " << ((float)((float)counter / (float)size)) * 100. << "%" << endl;
}

int main()
{
    srand(time(NULL));
    setlocale(LC_CTYPE, "ukr");
    int numofstudents;
    cout << "Enter the count of students: "; cin >> numofstudents;
    studentinfo* students = new studentinfo[numofstudents];
    AutoFillInfo(students, numofstudents);
    Print(students, numofstudents);
    Task1(students, numofstudents);
    Task2(students, numofstudents);

    system("pause");
    return 0;
}
