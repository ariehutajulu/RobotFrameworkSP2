*** Settings ***
Library           Selenium2Library

*** Variables ***
${SignIn}         //*[@class="hide_xs"]
${Email}          id=email_create
${SubmitCreateBtn}    id=SubmitCreate

*** Test Cases ***
TC_NavigateToURL
    [Documentation]    This will navigate to this URL http://103.226.139.66:8080/en/
    Open Browser    http://103.226.139.66:8080/en/    firefox
    Sleep    2
    Click Element    ${SignIn}

TC_SignUP
    [Documentation]    Test case ini untuk sign up
    Sleep    1
    Input Text    ${Email}    ariehutaju@gmail.com
    Click Button    ${SubmitCreateBtn}
    Sleep    1

TC_InputNewUser
    [Documentation]    TC untuk menginput isi data diri
    Click Element    id_gender1
    Input Text    customer_firstname    Arie
    Input Text    customer_lastname    Hutajulu
    Input Text    passwd    arie123
    Select From List by Value    name:days    20
    Select From List by Value    name:months    1
    Select From List by Value    name:years    1996
    Click Element    newsletter
    Click Element    uniform-optin
    Click Button    submitAccount
    Close Browser

TC_Login
    Open Browser    http://103.226.139.66:8080/en/    chrome
    Maximize Browser Window
    Sleep    2
    Click Element    ${SignIn}
    Sleep    1
    Input Text    email    ariehutaju@gmail.com
    Sleep    1
    Input Text    passwd    arie123
    Click Button    SubmitLogin
    Sleep    1
    Element Should Contain    class=info-account    Welcome to your account.
    Sleep    1
    Click Element    //*[@class="icon-chevron-left"]

TC_AddAdress
    Click Element    class=icon-building
    Sleep    1
    Input Text    company    PT.INDONESIA
    Input Text    address1    Jalan.Kalimalang No.2
    Input Text    postcode    12018
    Input Text    city    Jakarta
    Sleep    1
    Select From List by Value    //*[@id="id_state"]    318
    Select From List by Value    //*[@id="id_country"]    111
    Input Text    phone    021912938
    Input Text    phone_mobile    08128332888
    Click Element    alias
    Click Button    submitAddress
    Sleep    1
    Element Should Contain    /html/body/div/div[2]/div/div[2]/div/div[1]/p[1]/strong    Your addresses are listed below.

TC_SearchHotel
    Input Text    hotel_location    Aceh
    Sleep    1
    Click Button    id_hotel_button
    Sleep    1
    Click Element    //*[@class="search_result_li"]
    Click Element    check_in_time
    Sleep    1
    Click Element    //*[@id="ui-datepicker-div"]//*[text()=28]
    Click Element    check_out_time
    Sleep    1
    Click Element    //*[@id="ui-datepicker-div"]//*[text()=30]
    Sleep    1
    Click Button    search_room_submit

TC_BookingHotelExecutive
    [Documentation]    Booking Executive Hotel
    Click Element    //*[@id="category_data_cont"]//a[@data-id-product="3"]
    Sleep    2
    Element Should Contain    layer_cart_product_title    Executive Rooms

TC_PaymentBankwire
    [Documentation]    Payment Executive Hotel
    Click Element    //*[@id="layer_cart"]/div[1]/div[2]/div[4]/a
    Sleep    1
    Click Element    //*[@id="collapse-shopping-cart"]//*[@title="Proceed to checkout"]
    Sleep    1
    Click Link    //a[@href='http://103.226.139.66:8080/en/quick-order?proceed_to_payment=1']
    Sleep    1
    Click Element    tc_txt
    Sleep    20
    Click Element    //a[@href='http://103.226.139.66:8080/en/module/bankwire/payment']
    Sleep    1
    Click Button    //*[@id="cart_navigation"]/button
    Sleep    1
    Element Should Contain    //*[@id="center_column"]/div[1]/p[1]    Your order on Sekolah QA is complete.
    Sleep    1
    Click Element    //*[@id="center_column"]/p/a/i

TC_BookingHotel28-29Luxury
    Click Element    //*[@id="category_data_cont"]//a[@data-id-product="4"]
    Sleep    2
    Element Should Contain    layer_cart_product_title    luxury Rooms

TC_BookedAndSeeCart
    [Documentation]    TC when we put orders to chart not directly pay
    Sleep    1
    Click Element    //span[@class="cross"]
    Sleep    1
    Mouse Over    //*[@id="header"]//a[@rel="nofollow"]

TC_RemoveOrder
    Mouse Over    //*[@id="header"]//a[@rel="nofollow"]
    Sleep    1
    Click Element    //*[@id="booking_dates_container_4"]//a[@rm_price="2750"]
    Sleep    2
    Click Element    //*[@id="header"]//a[@rel="nofollow"]
    Sleep    1
    Element Should Contain    //*[@id="content"]/div/p    Till now you did not added any room in your cart.

ClickMenu3
    [Documentation]    Click Menu garis 3
    Sleep    1
    Click Element    //*[@id="header"]//*[@class="nav_toggle"]

Click Home
    Click Element    //*[@id="menu_cont"]//a[@href="http://103.226.139.66:8080/en/"]
    Sleep    1
    Title Should Be    Sekolah QA

Click Interior
    Sleep    1
    Click Element    //*[@id="header"]//*[@class="nav_toggle"]
    Sleep    1
    Click Element    //*[@id="menu_cont"]//a[@href="/#hotelInteriorBlock"]
    Sleep    1
    Element Should Contain    //*[@id="hotelInteriorBlock"]//p[@class="home_block_heading"]    Interior

Click Amenities
    Sleep    1
    Click Element    //*[@id="menu_cont"]//a[@href="/#hotelAmenitiesBlock"]
    Sleep    1
    Element Should Contain    //*[@id="hotelAmenitiesBlock"]//p[@class="home_block_heading"]    Amenities

Click Rooms
    Sleep    1
    Click Element    //*[@id="menu_cont"]//a[@href="/#hotelRoomsBlock"]
    Sleep    1
    Element Should Contain    //*[@id="hotelRoomsBlock"]//p[@class="home_block_heading"]    Our Rooms

Click Testimonials
    Sleep    1
    Click Element    //*[@id="menu_cont"]//a[@href="/#hotelTestimonialBlock"]
    Sleep    1
    Element Should Contain    //*[@id="hotelTestimonialBlock"]//p[@class="home_block_heading"]    What Our Guest

Click Legal Notice
    Sleep    1
    Click Element    //*[@id="menu_cont"]//a[@href="http://103.226.139.66:8080/en/content/2-legal-notice"]
    Sleep    1
    Element Should Contain    //*[@id="center_column"]/div/h2    Legal

Click About Us
    Sleep    1
    Click Element    //*[@id="header"]//*[@class="nav_toggle"]
    Sleep    1
    Click Element    //*[@id="menu_cont"]//a[@href="http://103.226.139.66:8080/en/content/4-about-us"]
    Sleep    1
    Element Should Contain    //*[@id="center_column"]/div/h1    ABOUT US

Click Contact
    Sleep    1
    Click Element    //*[@id="header"]//*[@class="nav_toggle"]
    Sleep    1
    Click Element    //*[@id="menu_cont"]//a[@href="http://103.226.139.66:8080/en/contact-us"]
    Element Should Contain    //*[@id="center_column"]/div/div[1]/p[1]    Contact Us

TC_SendMessagesLengkkap
    Sleep    1
    Click Element    //*[@id="header"]//*[@class="nav_toggle"]
    Sleep    1
    Click Element    //*[@id="menu_cont"]//a[@href="http://103.226.139.66:8080/en/contact-us"]
    Element Should Contain    //*[@id="center_column"]/div/div[1]/p[1]    Contact Us
    Sleep    1
    Click Element    //*[@id="center_column"]//*[@id="contact_type"]
    Sleep    1
    Click Element    //ul[@class="dropdown-menu contact_type_ul"]//li[@value="2"]
    Input Text    //*[@id="message"]    Hotelnya ada Wifi Ga ya?
    Choose File    //*[@id="fileUpload"]    C://Users/arieh/Pictures/Screenshots/Screenshot (4).png
    Click Button    submitMessage
    Sleep    1
    Element Should Contain    //*[@id="center_column"]/p    Your message has been successfully sent to our team.

TC_SendMessageInvalid
    [Documentation]    Message Kosong
    Sleep    1
    Click Element    //*[@id="header"]//*[@class="nav_toggle"]
    Sleep    1
    Click Element    //*[@id="menu_cont"]//a[@href="http://103.226.139.66:8080/en/contact-us"]
    Element Should Contain    //*[@id="center_column"]/div/div[1]/p[1]    Contact Us
    Sleep    1
    Click Element    //*[@id="center_column"]//*[@id="contact_type"]
    Sleep    1
    Click Element    //ul[@class="dropdown-menu contact_type_ul"]//li[@value="2"]
    Choose File    //*[@id="fileUpload"]    C://Users/arieh/Pictures/Screenshots/Screenshot (4).png
    Click Button    submitMessage
    Sleep    1
    Element Should Contain    //*[@id="center_column"]/div[1]/ol/li    The message cannot be blank.

TC_Check Order
    Click Element    //*[@id="user_info_acc"]/span[1]
    Sleep    1
    Click Element    //*[@id="header"]/div[3]/div/div/div[7]/ul/li/ul/li[2]/a
    Element Should Contain    //*[@id="center_column"]/h1    ORDER HISTORY

Logout
    Click Element    //*[@id="user_info_acc"]/span[1]
    Sleep    1
    Click Element    //*[@id="header"]/div[3]/div/div/div[7]/ul/li/ul/li[3]/a
