import pymysql
import PySimpleGUI as sg

def main():
    sg.theme("DarkGrey3")
    layout = [[sg.Text("Log In", size=(15, 1), font=40)],
              [sg.Text("Username", size=(15, 1), font=16), sg.InputText(key='-usrnm-', font=16)],
              [sg.Text("Password", size=(15, 1), font=16), sg.InputText(key='-pwd-', password_char='*', font=16)],
              [sg.Button('Ok'), sg.Button('Cancel')]]

    window = sg.Window("Log In", layout)

    while True:
        event, values = window.read()
        if event == "Cancel" or event == sg.WIN_CLOSED:
            break
        else:
            if event == "Ok":
                username, password = values['-usrnm-'], values['-pwd-']
                try:
                    conn = pymysql.connect(
                        host='127.0.0.1',
                        user=username,
                        password=password,
                        db='payroll_sys',
                    )
                except:
                    sg.popup("incorrect username or password")
                else:
                    window.close()

    cur = conn.cursor()
    cur.execute('select DOB from employee')
    output = cur.fetchall()

    # To close the connection
    sg.theme('DarkGrey3')
    layout = [
        [sg.Text('Payroll',size=(20,3),font=("Arial",25),justification="center")],
        [sg.Button('Employees'),sg.Button('Employers'),sg.Button('Available positions'),sg.Button('Average pay')],
         [sg.Button('Contact info'),sg.Button('Payment'),sg.Button('Num of employees'),sg.Button('Total amount payed')],
        [sg.Button('Employee financial info'),sg.Button('Employee Positions')]
              ]
    window = sg.Window("Payroll",layout)

    while True:
        event, values = window.read()
        if event == sg.WIN_CLOSED or event == "Exit":
            break
        elif event == "Employees":
            emp_window(conn)
        elif event == "Employers":
            employer_window(conn)
        elif event == "Available positions":
            pos_window(conn)
        elif event == "Average pay":
            q4_window(conn)
        elif event == "Contact info":
            q2_window(conn)
        elif event == "Payment":
            q5_window(conn)
        elif event == "Num of employees":
            q7_window(conn)
        elif event == "Total amount payed":
            q8_window(conn)
        elif event == "Employee financial info":
            q6_window(conn)
        elif event == "Employee Positions":
            q3_window(conn)

    conn.close()
    window.close()

def query1(con):
    qur = con.cursor()
    qur.execute("select * from employee")
    output = qur.fetchall()
    string = ""
    for i in output:
       string = string +str(i[0]) + ", " + str(i[1]) + ", " + str(i[2]) + ", " + i[3] + ", " + i[4] + ", " + i[5].strftime('%Y/%m/%d') + "\n"
    return string

def emp_window(con):
    text = query1(con)
    layout = [[sg.Text(text)]]
    window = sg.Window("Employees", layout)

    while True:
        event, values = window.read()
        if event == sg.WIN_CLOSED:
            break
    window.close()

def employer_query(con):
    qur = con.cursor()
    qur.execute('select * from employer')
    output = qur.fetchall()
    string = ""
    for i in output:
        string = string + str(i[0]) + ", " + i[1] + ", " + str(i[2]) + "\n"
    return string

def employer_window(con):
    text = employer_query(con)
    layout = [[sg.Text(text)]]
    window = sg.Window("Employers", layout)

    while True:
        event, values = window.read()
        if event == sg.WIN_CLOSED:
            break
    window.close()

def pos_query(con):
    qur = con.cursor()
    qur.execute('select dept, pos_name from job_pos')
    output = qur.fetchall()
    string = ""
    for i in output:
        string = string + i[0] + ", " + i[1] + "\n"
    return string

def pos_window(con):
    text = pos_query(con)
    layout = [[sg.Text(text)]]
    window = sg.Window("Available positions", layout)

    while True:
        event, values = window.read()
        if event == sg.WIN_CLOSED:
            break
    window.close()

def query2(con):
    qur = con.cursor()
    qur.execute("select employee_name, emp_email from employee")
    output = qur.fetchall()
    string = ""
    for i in output:
        string = string + i[0] + ", " + i[1] + "\n"
    return string

def q2_window(con):
    text = query2(con)
    layout = [[sg.Text(text)]]
    window = sg.Window("Contact info", layout)

    while True:
        event, values = window.read()
        if event == sg.WIN_CLOSED:
            break
    window.close()

def query3(con):
    qur = con.cursor()
    qur.execute("select employee_name, pos_name from employee inner join job_pos on (employee.pos_id = job_pos.pos_id)")
    output = qur.fetchall()
    string = ""
    for i in output:
        string = string + i[0] + ": " + i[1] + "\n"
    return string

def q3_window(con):
    text = query3(con)
    layout = [[sg.Text(text)]]
    window = sg.Window("Employee positions", layout)

    while True:
        event, values = window.read()
        if event == sg.WIN_CLOSED:
            break
    window.close()

def query4(con):
    qur = con.cursor()
    qur.execute("select round(avg(final_pay),2) as average_pay from payroll")
    output = qur.fetchone()
    string = str(output[0])
    return string

def q4_window(con):
    text = query4(con)
    layout = [[sg.Text(text)]]
    window = sg.Window("Average pay", layout)

    while True:
        event, values = window.read()
        if event == sg.WIN_CLOSED:
            break
    window.close()

def query5(con):
    qur = con.cursor()
    qur.execute("select employee_name,amount from employee cross join receives on (employee.employee_id = receives.employee_id)")
    output = qur.fetchall()
    string = ""
    for i in output:
        string = string + i[0] + ": " + str(i[1]) + "\n"
    return string

def q5_window(con):
    text = query5(con)
    layout = [[sg.Text(text)]]
    window = sg.Window("Payment", layout)

    while True:
        event, values = window.read()
        if event == sg.WIN_CLOSED:
            break
    window.close()

def query6(con):
    qur = con.cursor()
    qur.execute("select employee_name,pay_date,bonus,gross_pay,tax_deductions,final_pay from employee join receives on (employee.employee_id = receives.employee_id) join payroll on (payroll.pay_id = receives.pay_id)")
    output = qur.fetchall()
    string = ""
    for i in output:
        string = string + i[0] + ", " + i[1].strftime('%Y/%m/%d') + ", " + str(i[2]) + ", " + str(i[3]) + ", " + str(i[4]) + ", " + str(i[5]) + "\n"
    return string

def q6_window(con):
    text = query6(con)
    layout = [[sg.Text(text)]]
    window = sg.Window("Employee financial info", layout)

    while True:
        event, values = window.read()
        if event == sg.WIN_CLOSED:
            break
    window.close()

def query7(con):
    qur = con.cursor()
    qur.execute("select count(employee_name) from employee")
    return str(qur.fetchone()[0])

def q7_window(con):
    text = query7(con)
    layout = [[sg.Text(text)]]
    window = sg.Window("Number of employees", layout)

    while True:
        event, values = window.read()
        if event == sg.WIN_CLOSED:
            break
    window.close()

def query8(con):
    qur = con.cursor()
    qur.execute("select round(sum(amount),2) from receives")
    return str(qur.fetchone()[0])

def q8_window(con):
    text = query8(con)
    layout = [[sg.Text(text)]]
    window = sg.Window("Total amount payed", layout)

    while True:
        event, values = window.read()
        if event == sg.WIN_CLOSED:
            break
    window.close()

# Driver Code
if __name__ == "__main__":
    main()

