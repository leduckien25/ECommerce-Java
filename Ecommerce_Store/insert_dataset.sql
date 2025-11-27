USE ecommerce_store;

INSERT INTO `user` VALUES
(1, '$2a$10$LErpTQS8ob/0VpM8i/Myo.KDOKyGmj93MF8jfvn70JjdGZMZNd2.G', 'admin');

INSERT INTO category (id, category_name, category_description) VALUES 
(1, 'Sandwiches', 'Bánh mì kẹp và các loại Sub'),
(2, 'Burgers', 'Hamburger bò và gà các loại'),
(3, 'Wraps', 'Các món cuốn vỏ mềm'),
(4, 'Burritos', 'Burrito truyền thống'),
(5, 'Tacos', 'Taco vỏ giòn và mềm'),
(6, 'Quesadillas', 'Bánh nướng phô mai'),
(7, 'Chicken', 'Gà rán, gà viên và cánh gà'),
(8, 'Pizza', 'Pizza các loại'),
(9, 'Breakfast', 'Các món ăn sáng'),
(10, 'Salads', 'Salad rau trộn'),
(11, 'Bowls', 'Các món ăn trong tô'),
(12, 'Sides', 'Khoai tây chiên và đồ ăn kèm nóng'),
(13, 'Snacks', 'Snack đóng gói, bim bim'),
(14, 'Desserts', 'Bánh ngọt và tráng miệng'),
(15, 'Drinks', 'Đồ uống và giải khát'),
(16, 'Sauces', 'Nước sốt và gia vị');

-- 1. TurHamKen™ (Sandwich)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('TurHamKen™', 12.33, 'store_0_TurHamKen_0.jpg', 50, 'Sự kết hợp độc đáo giữa gà tây, thịt nguội và thịt gà thơm ngon.', 1);

-- 2. Festive Turkey (Sandwich)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Festive Turkey', 10.64, 'store_0_Festive_Turkey_1.jpg', 45, 'Bánh mì kẹp thịt gà tây mang hương vị lễ hội đặc biệt.', 1);

-- 3. Festive Chicken (Sandwich)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Festive Chicken', 11.68, 'store_0_Festive_Chicken_2.jpg', 60, 'Phiên bản gà lễ hội với nước sốt đậm đà.', 1);

-- 4. Grilled Chicken & Avocado (Sandwich)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Grilled Chicken & Avocado', 11.68, 'store_0_Grilled_Chicken__Avocado_3.jpg', 40, 'Gà nướng thơm lừng kết hợp cùng bơ tươi béo ngậy.', 1);

-- 5. Ham & Turkey Stacker (Sandwich)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Ham & Turkey Stacker', 10.38, 'store_0_Ham__Turkey_Stacker_4.jpg', 55, 'Lớp thịt nguội và gà tây xếp chồng hấp dẫn.', 1);

-- 6. Turkey & Ranch Delite (Sandwich)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Turkey & Ranch Delite', 11.03, 'store_0_Turkey__Ranch_Delite_5.jpg', 35, 'Thịt gà tây mềm mại hòa quyện cùng sốt Ranch béo ngậy.', 1);

-- 7. Seasoned Steak & Avocado (Sandwich)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Seasoned Steak & Avocado', 12.98, 'store_0_Seasoned_Steak__Avocado_6.jpg', 30, 'Bít tết tẩm gia vị đậm đà ăn kèm bơ tươi.', 1);

-- 8. Spicy Nacho Chicken (Sandwich)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Spicy Nacho Chicken', 11.42, 'store_0_Spicy_Nacho_Chicken_7.jpg', 42, 'Gà cay phong cách Nacho giòn tan kích thích vị giác.', 1);

-- 9. Steak Philly (Sandwich)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Steak Philly', 11.03, 'store_0_Steak_Philly_8.jpg', 50, 'Bánh mì kẹp bít tết phô mai kiểu Philadelphia cổ điển.', 1);

-- 10. Chipotle Philly (Sandwich)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Chipotle Philly', 11.03, 'store_0_Chipotle_Philly_9.jpg', 48, 'Steak Philly biến tấu với sốt Chipotle cay nồng.', 1);

-- 11. Cheesy Garlic (Sandwich)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Cheesy Garlic', 11.42, 'store_0_Cheesy_Garlic_10.jpg', 65, 'Bánh mì ngập tràn phô mai và hương tỏi thơm lừng.', 1);

-- 12. Chicken & Bacon Ranch (Sandwich)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Chicken & Bacon Ranch', 11.42, 'store_0_Chicken__Bacon_Ranch_11.jpg', 55, 'Sự kết hợp hoàn hảo giữa gà, thịt xông khói và sốt Ranch.', 1);

-- 13. Honey Mustard BBQ (Sandwich)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Honey Mustard BBQ', 11.42, 'store_0_Honey_Mustard_BBQ_12.jpg', 40, 'Vị nướng BBQ hòa quyện cùng sốt mù tạt mật ong ngọt ngào.', 1);

-- 14. Sweet Onion Chicken Teriyaki® (Sandwich)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Sweet Onion Chicken Teriyaki®', 11.42, 'store_0_Sweet_Onion_Chicken_Teriyaki_13.jpg', 50, 'Gà sốt Teriyaki kiểu Nhật với hành tây ngọt.', 1);

-- 15. Grilled Chicken (Sandwich)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Grilled Chicken', 10.12, 'store_0_Grilled_Chicken_14.jpg', 70, 'Bánh mì gà nướng tiêu chuẩn, tốt cho sức khỏe.', 1);

-- 16. B.M.T.® (Sandwich)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('B.M.T.®', 9.60, 'store_0_BMT_15.jpg', 80, 'Món "Biggest, Meatiest, Tastiest" với nhiều loại thịt nguội.', 1);

-- 17. Spicy Italian (Sandwich)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Spicy Italian', 9.60, 'store_0_Spicy_Italian_16.jpg', 60, 'Hương vị Ý cay nồng với salami và pepperoni.', 1);

-- 18. 5 Meat Italian (Sandwich)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('5 Meat Italian', 12.98, 'store_0_5_Meat_Italian_17.jpg', 45, 'Đại tiệc thịt với 5 loại thịt Ý đặc trưng.', 1);

-- 19. Meatball Pepperoni (Sandwich)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Meatball Pepperoni', 10.38, 'store_0_Meatball_Pepperoni_18.jpg', 50, 'Thịt viên sốt cà chua kết hợp cùng pepperoni.', 1);

-- 20. Meatball (Sandwich)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Meatball', 8.95, 'store_0_Meatball_19.jpg', 65, 'Bánh mì thịt viên sốt Marinara truyền thống.', 1);

-- 21. Oven-Roasted Turkey (Sandwich)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Oven-Roasted Turkey', 10.25, 'store_0_Oven-Roasted_Turkey_20.jpg', 55, 'Gà tây nướng lò thơm ngon, ít béo.', 1);

-- 22. Black Forest Ham (Sandwich)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Black Forest Ham', 9.60, 'store_0_Black_Forest_Ham_21.jpg', 60, 'Thịt nguội Black Forest trứ danh kẹp cùng rau tươi.', 1);

-- 23. Roast Beef (Sandwich)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Roast Beef', 12.33, 'store_0_Roast_Beef_22.jpg', 40, 'Thịt bò nướng thái lát mỏng mềm mại.', 1);

-- 24. Cold Cut Combo® (Sandwich)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Cold Cut Combo®', 8.43, 'store_0_Cold_Cut_Combo_23.jpg', 75, 'Combo thịt nguội cổ điển, sự lựa chọn tiết kiệm.', 1);

-- 25. Tuna (Sandwich)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Tuna', 9.99, 'store_0_Tuna_24.jpg', 50, 'Cá ngừ trộn sốt mayonnaise béo ngậy.', 1);

-- 26. Veggie Delite® (Sandwich)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Veggie Delite®', 7.78, 'store_0_Veggie_Delite_25.jpg', 80, 'Chỉ bao gồm rau củ tươi xanh, dành cho người ăn chay.', 1);

-- 27. All American Club® (Sandwich)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('All American Club®', 11.03, 'store_0_All_American_Club_26.jpg', 45, 'Hương vị Mỹ với gà tây, thịt nguội và thịt xông khói.', 1);

-- 28. Subway Club® (Sandwich)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Subway Club®', 11.68, 'store_0_Subway_Club_27.jpg', 50, 'Món Club đặc biệt của Subway với đầy đủ dinh dưỡng.', 1);

-- 29. Turkey & Ham (Sandwich)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Turkey & Ham', 10.38, 'store_0_Turkey__Ham_28.jpg', 60, 'Sự kết hợp đơn giản mà ngon miệng giữa gà tây và thịt nguội.', 1);

-- 30. B.L.T. (Sandwich)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('B.L.T.', 9.86, 'store_0_BLT_29.jpg', 55, 'Bacon, Lettuce, Tomato - Thịt xông khói, xà lách và cà chua.', 1);

-- 31. Pizza Sub (Sandwich - Dù tên là Pizza nhưng đây là bánh mì vị Pizza)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Pizza Sub', 8.56, 'store_0_Pizza_Sub_30.jpg', 40, 'Bánh mì nướng với sốt cà chua, pepperoni và phô mai.', 1);

-- 32. Veggie Patty (Sandwich)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Veggie Patty', 10.25, 'store_0_Veggie_Patty_31.jpg', 35, 'Bánh nhân chay đặc biệt giàu đạm thực vật.', 1);

-- 33. Subway® Footlong Cookie (Desserts)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Subway® Footlong Cookie', 7.78, 'store_0_Subway_Footlong_Cookie_32.jpg', 100, 'Bánh quy khổng lồ dài 30cm, ngọt ngào khó cưỡng.', 14);

-- 34. Double Chocolate Cookie (Desserts)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Double Chocolate Cookie', 1.15, 'store_0_Double_Chocolate_Cookie_33.jpg', 120, 'Bánh quy sô cô la đậm đà gấp đôi hương vị.', 14);

-- 35. Chocolate Chip Cookie (Desserts)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Chocolate Chip Cookie', 1.15, 'store_0_Chocolate_Chip_Cookie_34.jpg', 150, 'Bánh quy sô cô la chip truyền thống giòn tan.', 14);

-- 36. White Chip Macadamia Nut Cookie (Desserts)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('White Chip Macadamia Nut Cookie', 1.15, 'store_0_White_Chip_Macadamia_Nut_Cookie_35.jpg', 110, 'Bánh quy hạt mắc ca và sô cô la trắng thượng hạng.', 14);

-- 37. Oatmeal Raisin Cookie (Desserts)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Oatmeal Raisin Cookie', 1.15, 'store_0_Oatmeal_Raisin_Cookie_36.jpg', 90, 'Bánh quy yến mạch nho khô, tốt cho sức khỏe.', 14);

-- 38. Raspberry Cheesecake Cookie (Desserts)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Raspberry Cheesecake Cookie', 1.15, 'store_0_Raspberry_Cheesecake_Cookie_37.jpg', 100, 'Bánh quy hương vị bánh phô mai mâm xôi độc đáo.', 14);

-- 39. Lays® Classic (Snacks)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Lays® Classic', 2.45, 'store_0_Lays_Classic_38.jpg', 200, 'Khoai tây chiên Lays vị truyền thống giòn rụm.', 13);

-- 40. SunChips® Harvest Cheddar® (Snacks)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('SunChips® Harvest Cheddar®', 2.32, 'store_0_SunChips_Harvest_Cheddar_39.jpg', 180, 'Snack ngũ cốc SunChips vị phô mai Cheddar.', 13);

-- 41. Miss Vickie’s® Jalapeño (Snacks)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Miss Vickie’s® Jalapeño', 2.45, 'store_0_Miss_Vickies_Jalapeño_40.jpg', 150, 'Khoai tây chiên giòn vị ớt Jalapeño cay nồng.', 13);

-- 42. Doritos® Nacho Cheese (Snacks)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Doritos® Nacho Cheese', 2.45, 'store_0_Doritos_Nacho_Cheese_41.jpg', 200, 'Snack ngô Doritos vị phô mai Nacho kinh điển.', 13);

-- 43. Lays® Baked Original (Snacks)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Lays® Baked Original', 2.45, 'store_0_Lays_Baked_Original_42.jpg', 120, 'Khoai tây nướng ít dầu, giữ nguyên vị ngon tự nhiên.', 13);

-- 44. Doritos®  Cool Ranch® (Snacks)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Doritos®  Cool Ranch®', 2.45, 'store_0_Doritos__Cool_Ranch_43.jpg', 180, 'Snack ngô giòn rụm với vị sốt Ranch mát lạnh.', 13);

-- 45. Lays® Baked BBQ (Snacks)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Lays® Baked BBQ', 2.45, 'store_0_Lays_Baked_BBQ_44.jpg', 130, 'Khoai tây nướng vị sườn nướng BBQ đậm đà.', 13);

-- 46. Ruffles® Baked Cheddar & Sour Cream (Snacks)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Ruffles® Baked Cheddar & Sour Cream', 2.45, 'store_0_Ruffles_Baked_Cheddar__Sour_Cream_45.jpg', 140, 'Khoai tây lát gợn sóng vị phô mai Cheddar và kem chua.', 13);

-- 47. Lay''s® BBQ (Snacks)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Lay''s® BBQ', 2.45, 'store_0_Lays_BBQ_46.jpg', 160, 'Khoai tây chiên Lays vị BBQ truyền thống.', 13);

-- 48. Lay’s® Salt & Vinegar (Snacks)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Lay’s® Salt & Vinegar', 2.45, 'store_0_Lays_Salt__Vinegar_47.jpg', 110, 'Hương vị chua mặn độc đáo của muối và giấm.', 13);

-- 49. SunChips® Garden Salsa® (Snacks)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('SunChips® Garden Salsa®', 2.45, 'store_0_SunChips_Garden_Salsa_48.jpg', 90, 'Snack ngũ cốc vị sốt Salsa vườn tươi mát.', 13);

-- 50. GoGo squeeZ® Apple Apple (Snacks/Dessert)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('GoGo squeeZ® Apple Apple', 2.45, 'store_0_GoGo_squeeZ_Apple_Apple_49.jpg', 100, 'Sốt táo xay nhuyễn đóng túi tiện lợi, tốt cho sức khỏe.', 13);

-- 51. 6 Pack Cookie Box (Desserts)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('6 Pack Cookie Box', 6.48, 'store_0_6_Pack_Cookie_Box_50.jpg', 50, 'Hộp 6 chiếc bánh quy tự chọn, tiết kiệm hơn.', 14);

-- 52. Bacon, Egg & Cheese (Breakfast)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Bacon, Egg & Cheese', 8.04, 'store_0_Bacon_Egg__Cheese_89.jpg', 60, 'Bữa sáng giàu năng lượng với trứng, phô mai và thịt xông khói.', 9);

-- 53. Steak, Egg & Cheese (Breakfast)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Steak, Egg & Cheese', 8.30, 'store_0_Steak_Egg__Cheese_90.jpg', 55, 'Bánh mì kẹp bít tết và trứng ốp la cho buổi sáng.', 9);

-- 54. Egg & Cheese (Breakfast)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Egg & Cheese', 7.78, 'store_0_Egg__Cheese_91.jpg', 70, 'Lựa chọn bữa sáng nhẹ nhàng với trứng và phô mai tan chảy.', 9);

-- 55. Black Forest Ham, Egg & Cheese (Breakfast)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Black Forest Ham, Egg & Cheese', 7.91, 'store_0_Black_Forest_Ham_Egg__Cheese_92.jpg', 65, 'Thịt nguội Black Forest kết hợp cùng trứng nóng hổi.', 9);

-- 56. Steak, Egg & Cheese Wrap (Breakfast/Wrap)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Steak, Egg & Cheese Wrap', 12.46, 'store_0_Steak_Egg__Cheese_Wrap_93.jpg', 40, 'Bánh cuốn wrap nhân bít tết và trứng.', 9);

-- 57. Black Forest Ham, Egg & Cheese Wrap (Breakfast/Wrap)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Black Forest Ham, Egg & Cheese Wrap', 11.81, 'store_0_Black_Forest_Ham_Egg__Cheese_Wrap_94.jpg', 45, 'Wrap bữa sáng với thịt nguội và phô mai.', 9);

-- 58. Egg & Cheese Wrap (Breakfast/Wrap)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Egg & Cheese Wrap', 11.81, 'store_0_Egg__Cheese_Wrap_95.jpg', 50, 'Bánh cuốn trứng phô mai đơn giản và ngon miệng.', 9);

-- 59. Bacon, Egg & Cheese Wrap (Breakfast/Wrap)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Bacon, Egg & Cheese Wrap', 12.07, 'store_0_Bacon_Egg__Cheese_Wrap_96.jpg', 48, 'Wrap thịt xông khói giòn tan cùng trứng.', 9);

-- 60. Personal Cheese Pizza (Pizza)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Personal Cheese Pizza', 9.21, 'store_0_Personal_Cheese_Pizza_118.jpg', 30, 'Pizza phô mai cỡ cá nhân, đế giòn nóng hổi.', 8);

-- 61. Celsius® Sparkling Orange (Drinks)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Celsius® Sparkling Orange', 5.83, 'store_0_Celsius_Sparkling_Orange_119.jpg', 80, 'Nước uống năng lượng vị cam sủi bọt.', 15);

-- 62. Pepsi® (Drinks)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Pepsi®', 4.66, 'store_0_Pepsi_120.jpg', 200, 'Nước ngọt có gas Pepsi truyền thống.', 15);

-- 63. Pepsi® Zero Sugar (Drinks)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Pepsi® Zero Sugar', 4.66, 'store_0_Pepsi_Zero_Sugar_121.jpg', 150, 'Pepsi không đường, sảng khoái không lo calo.', 15);

-- 64. Diet Pepsi® (Drinks)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Diet Pepsi®', 4.66, 'store_0_Diet_Pepsi_122.jpg', 100, 'Pepsi dành cho người ăn kiêng.', 15);

-- 65. Starry® (Drinks)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Starry®', 4.66, 'store_0_Starry_123.jpg', 120, 'Nước ngọt vị chanh trong suốt, tươi mát.', 15);

-- 66. Mountain Dew® (Drinks)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Mountain Dew®', 4.66, 'store_0_Mountain_Dew_124.jpg', 130, 'Nước uống có gas vị cam chanh độc đáo.', 15);

-- 67. Pure Leaf® Sweet Iced Tea (Drinks)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Pure Leaf® Sweet Iced Tea', 4.66, 'store_0_Pure_Leaf_Sweet_Iced_Tea_125.jpg', 90, 'Trà đen pha lạnh có đường, vị thật như trà nhà làm.', 15);

-- 68. Rockstar® Punched (Drinks)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Rockstar® Punched', 5.18, 'store_0_Rockstar_Punched_126.jpg', 70, 'Nước tăng lực Rockstar vị trái cây mạnh mẽ.', 15);

-- 69. Tropicana® Pure Premium® Original Orange Juice, No Pulp (Drinks)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Tropicana® Pure Premium® Original Orange Juice, No Pulp', 4.66, 'store_0_Tropicana_Pure_Premium_Original_Orange_Juice_No_Pu_127.jpg', 85, 'Nước cam ép nguyên chất 100%, không tép.', 15);

-- 70. Dole® Lemonade (Drinks)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Dole® Lemonade', 4.66, 'store_0_Dole_Lemonade_128.jpg', 95, 'Nước chanh tươi mát lạnh từ Dole.', 15);

-- 71. Gatorade® Cool Blue (Drinks)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Gatorade® Cool Blue', 4.66, 'store_0_Gatorade_Cool_Blue_129.jpg', 110, 'Nước uống thể thao Gatorade vị Cool Blue.', 15);

-- 72. Gatorade® Fruit Punch (Drinks)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Gatorade® Fruit Punch', 4.66, 'store_0_Gatorade_Fruit_Punch_130.jpg', 110, 'Nước uống thể thao Gatorade vị trái cây hỗn hợp.', 15);

-- 73. Gatorade® Zero Sugar, Orange (Drinks)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Gatorade® Zero Sugar, Orange', 4.66, 'store_0_Gatorade_Zero_Sugar_Orange_131.jpg', 90, 'Gatorade không đường vị cam.', 15);

-- 74. Aquafina® (Drinks)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Aquafina®', 3.75, 'store_0_Aquafina_132.jpg', 300, 'Nước tinh khiết đóng chai Aquafina.', 15);

-- 75. 1% Low Fat Milk (Drinks)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('1% Low Fat Milk', 3.75, 'store_0_1_Low_Fat_Milk_133.jpg', 60, 'Sữa tươi ít béo 1% dinh dưỡng.', 15);

-- 76. Chocolate Milk (Drinks)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Chocolate Milk', 3.75, 'store_0_Chocolate_Milk_134.jpg', 70, 'Sữa tươi vị sô cô la thơm ngon.', 15);

-- 77. Honest Kids® Super Fruit Punch (Drinks)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Honest Kids® Super Fruit Punch', 2.32, 'store_0_Honest_Kids_Super_Fruit_Punch_135.jpg', 80, 'Nước trái cây hữu cơ cho trẻ em, ít đường.', 15);

-- 78. Pineapple Lime Rockstar® Energy Refresca - Medium (Drinks)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Pineapple Lime Rockstar® Energy Refresca - Medium', 5.48, 'store_1_Pineapple_Lime_Rockstar_Energy_Refresca_-_Medium_0.jpg', 50, 'Nước tăng lực vị dứa và chanh tươi mát.', 15);

-- 79. Cantina Chicken Bowl (Bowls)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Cantina Chicken Bowl', 11.70, 'store_1_Cantina_Chicken_Bowl_1.jpg', 40, 'Tô gà Cantina với cơm, đậu đen và rau củ tươi.', 11);

-- 80. Cantina Chicken Crispy Taco Meal (Tacos)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Cantina Chicken Crispy Taco Meal', 11.70, 'store_1_Cantina_Chicken_Crispy_Taco_Meal_2.jpg', 45, 'Combo Taco gà vỏ giòn tan kèm nước uống.', 5);

-- 81. Cantina Chicken Burrito Meal (Burritos)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Cantina Chicken Burrito Meal', 14.02, 'store_1_Cantina_Chicken_Burrito_Meal_3.jpg', 40, 'Bữa ăn trọn vẹn với Burrito gà Cantina, khoai chiên và nước.', 4);

-- 82. Cantina Chicken Quesadilla Meal (Quesadillas)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Cantina Chicken Quesadilla Meal', 13.29, 'store_1_Cantina_Chicken_Quesadilla_Meal_4.jpg', 35, 'Combo Quesadilla gà giòn tan cùng đồ ăn kèm.', 6);

-- 83. Avocado Verde Salsa Sauce Packet (Sauces)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Avocado Verde Salsa Sauce Packet', 0.35, 'store_1_Avocado_Verde_Salsa_Sauce_Packet_5.jpg', 500, 'Gói sốt bơ xanh Salsa Verde thơm ngon tiện lợi.', 16);

-- 84. 3 Crunchy Tacos Combo (Tacos)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('3 Crunchy Tacos Combo', 10.24, 'store_1_3_Crunchy_Tacos_Combo_6.jpg', 50, 'Bộ 3 bánh Taco vỏ giòn rụm kinh điển kèm nước.', 5);

-- 85. 3 Crunchy Tacos Supreme® Combo (Tacos)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('3 Crunchy Tacos Supreme® Combo', 11.58, 'store_1_3_Crunchy_Tacos_Supreme_Combo_7.jpg', 45, 'Nâng cấp với kem chua và cà chua tươi trong bộ 3 Taco Supreme.', 5);

-- 86. Burrito Supreme® Combo (Burritos)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Burrito Supreme® Combo', 11.21, 'store_1_Burrito_Supreme_Combo_8.jpg', 40, 'Combo Burrito Supreme đầy đặn nhân thịt và đậu.', 4);

-- 87. Classic Luxe Box (Tacos - Mixed)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Classic Luxe Box', 6.10, 'store_1_Classic_Luxe_Box_12.jpg', 60, 'Hộp phần ăn tiết kiệm với các món Taco và Burrito cơ bản.', 5);

-- 88. Supreme Luxe Box (Tacos - Mixed)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Supreme Luxe Box', 8.54, 'store_1_Supreme_Luxe_Box_13.jpg', 55, 'Hộp phần ăn cao cấp với Chalupa và Taco Supreme.', 5);

-- 89. Variety Taco Party Pack (Tacos)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Variety Taco Party Pack', 32.32, 'store_1_Variety_Taco_Party_Pack_14.jpg', 20, 'Gói tiệc tùng với 12 chiếc Taco các loại cho cả nhóm.', 5);

-- 90. Cheesy Roll Up (Snacks/Quesadillas)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Cheesy Roll Up', 1.70, 'store_1_Cheesy_Roll_Up_15.jpg', 100, 'Bánh cuộn phô mai tan chảy đơn giản mà ngon tuyệt.', 6);

-- 91. Black Bean Crunchwrap Supreme® (Wraps)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Black Bean Crunchwrap Supreme®', 8.16, 'store_1_Black_Bean_Crunchwrap_Supreme_16.jpg', 45, 'Bánh đa giác vỏ giòn nhân đậu đen chay độc đáo.', 3);

-- 92. Veggie Mexican Pizza (Pizza)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Veggie Mexican Pizza', 7.06, 'store_1_Veggie_Mexican_Pizza_17.jpg', 30, 'Pizza kiểu Mexico với vỏ bánh tortilla giòn và nhân chay.', 8);

-- 93. Frank’s RedHot® Diablo Chicken Nacho Fries (Sides)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Frank’s RedHot® Diablo Chicken Nacho Fries', 6.70, 'store_1_Franks_RedHot_Diablo_Chicken_Nacho_Fries_18.jpg', 50, 'Khoai tây chiên tẩm gia vị ăn kèm gà sốt cay Diablo.', 12);

-- 94. Classic Stacker (Wraps/Quesadillas)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Classic Stacker', 2.67, 'store_1_Classic_Stacker_19.jpg', 70, 'Các lớp bánh tortilla xếp chồng nhân thịt bò và phô mai.', 3);

-- 95. 3 Cheese Chicken Flatbread Melt (Wraps)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('3 Cheese Chicken Flatbread Melt', 2.79, 'store_1_3_Cheese_Chicken_Flatbread_Melt_20.jpg', 65, 'Bánh mì dẹt nướng phô mai 3 loại và thịt gà.', 3);

-- 96. Cheesy Fiesta Potatoes (Sides)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Cheesy Fiesta Potatoes', 3.04, 'store_1_Cheesy_Fiesta_Potatoes_22.jpg', 80, 'Khoai tây cắt miếng phủ sốt phô mai và kem chua.', 12);

-- 97. Cheesy Double Beef Burrito (Burritos)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Cheesy Double Beef Burrito', 3.40, 'store_1_Cheesy_Double_Beef_Burrito_23.jpg', 60, 'Burrito gấp đôi lượng thịt bò với nhiều phô mai.', 4);

-- 98. Loaded Beef Nachos (Sides)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Loaded Beef Nachos', 3.65, 'store_1_Loaded_Beef_Nachos_24.jpg', 55, 'Nachos đầy ắp thịt bò, đậu và sốt phô mai.', 12);

-- 99. Chips and Guacamole (Sides)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Chips and Guacamole', 3.65, 'store_1_Chips_and_Guacamole_25.jpg', 90, 'Snack ngô giòn chấm sốt bơ Guacamole tươi làm hàng ngày.', 12);

-- 100. Black Bean Chalupa Supreme (Tacos)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Black Bean Chalupa Supreme', 6.09, 'store_1_Black_Bean_Chalupa_Supreme_26.jpg', 40, 'Vỏ bánh Chalupa chiên phồng kẹp nhân đậu đen.', 5);

-- 101. Frank''s RedHot® Diablo Crispy Chicken Soft Taco (Tacos)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Frank''s RedHot® Diablo Crispy Chicken Soft Taco', 3.89, 'store_1_Franks_RedHot_Diablo_Crispy_Chicken_Soft_Taco_27.jpg', 50, 'Taco vỏ mềm nhân gà giòn sốt cay Frank''s RedHot.', 5);

-- 102. Avocado Ranch Crispy Chicken Soft Taco (Tacos)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Avocado Ranch Crispy Chicken Soft Taco', 3.89, 'store_1_Avocado_Ranch_Crispy_Chicken_Soft_Taco_28.jpg', 55, 'Taco gà giòn kết hợp sốt bơ Ranch béo ngậy.', 5);

-- 103. Cantina Chicken Crispy Taco (Tacos)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Cantina Chicken Crispy Taco', 4.14, 'store_1_Cantina_Chicken_Crispy_Taco_29.jpg', 60, 'Taco gà Cantina với vỏ bánh giòn rụm.', 5);

-- 104. Cantina Chicken Soft Taco (Tacos)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Cantina Chicken Soft Taco', 4.14, 'store_1_Cantina_Chicken_Soft_Taco_30.jpg', 65, 'Taco gà Cantina vỏ mềm dễ ăn.', 5);

-- 105. Double Stacked Taco (Tacos)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Double Stacked Taco', 2.43, 'store_1_Double_Stacked_Taco_31.jpg', 70, 'Sự kết hợp giữa vỏ mềm và vỏ giòn với lớp phô mai ở giữa.', 5);

-- 106. Frank''s RedHot® Diablo Crispy Chicken Burrito (Burritos)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Frank''s RedHot® Diablo Crispy Chicken Burrito', 7.06, 'store_1_Franks_RedHot_Diablo_Crispy_Chicken_Burrito_32.jpg', 45, 'Burrito gà giòn cay nồng sốt Diablo đặc biệt.', 4);

-- 107. Avocado Ranch Crispy Chicken Burrito (Burritos)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Avocado Ranch Crispy Chicken Burrito', 7.06, 'store_1_Avocado_Ranch_Crispy_Chicken_Burrito_33.jpg', 48, 'Burrito gà giòn sốt bơ Ranch thơm lừng.', 4);

-- 108. Cantina Chicken Burrito (Burritos)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Cantina Chicken Burrito', 7.92, 'store_1_Cantina_Chicken_Burrito_34.jpg', 50, 'Burrito cao cấp với gà xé phay và nguyên liệu tươi.', 4);

-- 109. Black Bean Grilled Cheese Burrito - Black Beans (Burritos)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Black Bean Grilled Cheese Burrito - Black Beans', 6.58, 'store_1_Black_Bean_Grilled_Cheese_Burrito_-_Black_Beans_36.jpg', 35, 'Burrito nướng phô mai cháy cạnh nhân đậu đen.', 4);

-- 110. Chicken Quesadilla (Quesadillas)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Chicken Quesadilla', 6.94, 'store_1_Chicken_Quesadilla_37.jpg', 55, 'Bánh Quesadilla nhân gà nướng và phô mai nóng chảy.', 6);

-- 111. Cheese Quesadilla (Quesadillas)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Cheese Quesadilla', 6.45, 'store_1_Cheese_Quesadilla_38.jpg', 60, 'Quesadilla ngập tràn phô mai, dành cho tín đồ cheese.', 6);

-- 112. Steak Quesadilla (Quesadillas)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Steak Quesadilla', 8.28, 'store_1_Steak_Quesadilla_39.jpg', 40, 'Quesadilla nhân bít tết cao cấp đậm đà.', 6);

-- 113. Cantina Chicken Quesadilla (Quesadillas)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Cantina Chicken Quesadilla', 8.41, 'store_1_Cantina_Chicken_Quesadilla_40.jpg', 42, 'Quesadilla phiên bản Cantina với gà xé đặc biệt.', 6);

-- 114. Nachos BellGrande® (Sides)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Nachos BellGrande®', 7.92, 'store_1_Nachos_BellGrande_41.jpg', 50, 'Phần Nachos "khổng lồ" với đầy đủ topping thịt và sốt.', 12);

-- 115. Chips and Nacho Cheese Sauce (Sides)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Chips and Nacho Cheese Sauce', 3.16, 'store_1_Chips_and_Nacho_Cheese_Sauce_42.jpg', 120, 'Snack ngô giòn chấm sốt phô mai vàng óng.', 12);

-- 116. Veggie Bowl (Bowls)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Veggie Bowl', 11.46, 'store_1_Veggie_Bowl_46.jpg', 30, 'Tô cơm rau củ đầy đủ dinh dưỡng cho người ăn chay.', 11);

-- 117. Mountain Dew Baja Midnight™ (Drinks)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Mountain Dew Baja Midnight™', 3.04, 'store_1_Mountain_Dew_Baja_Midnight_47.jpg', 80, 'Mountain Dew vị mâm xôi đen huyền bí.', 15);

-- 118. Strawberry Passionfruit Agua Refresca - Medium (Drinks)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Strawberry Passionfruit Agua Refresca - Medium', 4.87, 'store_1_Strawberry_Passionfruit_Agua_Refresca_-_Medium_48.jpg', 60, 'Nước giải khát vị dâu tây và chanh dây.', 15);

-- 119. Mango Peach Agua Refresca - Medium (Drinks)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Mango Peach Agua Refresca - Medium', 4.87, 'store_1_Mango_Peach_Agua_Refresca_-_Medium_49.jpg', 60, 'Hương vị nhiệt đới từ xoài và đào tươi mát.', 15);

-- 120. Tropical Punch Rockstar® Energy Refresca - Medium (Drinks)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Tropical Punch Rockstar® Energy Refresca - Medium', 5.48, 'store_1_Tropical_Punch_Rockstar_Energy_Refresca_-_Medium_50.jpg', 50, 'Nước tăng lực Rockstar vị trái cây nhiệt đới.', 15);

-- 121. Tropicana® Original Lemonade (Drinks)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Tropicana® Original Lemonade', 3.04, 'store_1_Tropicana_Original_Lemonade_52.jpg', 80, 'Nước chanh Tropicana nguyên chất tươi mát.', 15);

-- 122. Cinnabon Delights® 2 Pack (Desserts)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Cinnabon Delights® 2 Pack', 2.92, 'store_1_Cinnabon_Delights_2_Pack_53.jpg', 60, 'Bánh ngọt nhân kem quế Cinnabon, gói 2 chiếc.', 14);

-- 123. Cinnamon Twists (Desserts)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Cinnamon Twists', 1.57, 'store_1_Cinnamon_Twists_54.jpg', 90, 'Bánh xoắn chiên giòn phủ đường quế thơm lừng.', 14);

-- 124. Cinnabon Delights® 12 Pack (Desserts)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Cinnabon Delights® 12 Pack', 9.14, 'store_1_Cinnabon_Delights_12_Pack_55.jpg', 40, 'Hộp 12 chiếc bánh Cinnabon nóng hổi cho cả nhóm.', 14);

-- 125. Jalapeño Peppers (Sides)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Jalapeño Peppers', 0.73, 'store_1_Jalapeño_Peppers_58.jpg', 150, 'Ớt Jalapeño ngâm chua cay, món ăn kèm kích thích vị giác.', 12);

-- 126. Mexican Pizza Sauce (Sauces)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Mexican Pizza Sauce', 0.48, 'store_1_Mexican_Pizza_Sauce_59.jpg', 200, 'Sốt cà chua gia vị Mexico đặc trưng cho món Pizza.', 16);

-- 127. 3 Piece McCrispy™ Strips Meal (Chicken)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('3 Piece McCrispy™ Strips Meal', 10.49, 'store_2_3_Piece_McCrispy_Strips_Meal_0.jpg', 45, 'Combo 3 miếng gà phi lê chiên giòn McCrispy kèm khoai và nước.', 7);

-- 128. OREO® McFlurry® (Desserts)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('OREO® McFlurry®', 5.89, 'store_2_OREO_McFlurry_1.jpg', 70, 'Kem tươi trộn vụn bánh quy OREO ngọt ngào.', 14);

-- 129. 3 Piece McCrispy™ Strips (Chicken)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('3 Piece McCrispy™ Strips', 5.89, 'store_2_3_Piece_McCrispy_Strips_2.jpg', 50, '3 miếng gà phi lê tẩm bột chiên giòn rụm.', 7);

-- 130. McRib® (Sandwiches)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('McRib®', 6.89, 'store_2_McRib_4.jpg', 40, 'Bánh mì kẹp thịt heo nướng sốt BBQ trứ danh.', 1);

-- 131. McRib® Meal (Sandwiches)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('McRib® Meal', 10.89, 'store_2_McRib_Meal_5.jpg', 35, 'Bữa ăn trọn vẹn với McRib, khoai tây chiên và nước ngọt.', 1);

-- 132. Spicy McCrispy™ Meal (Burgers/Chicken)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Spicy McCrispy™ Meal', 9.99, 'store_2_Spicy_McCrispy_Meal_6.jpg', 50, 'Burger gà chiên giòn vị cay kèm khoai và nước.', 2);

-- 133. Deluxe Spicy McCrispy™ Meal (Burgers/Chicken)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Deluxe Spicy McCrispy™ Meal', 10.39, 'store_2_Deluxe_Spicy_McCrispy_Meal_7.jpg', 45, 'Phiên bản Deluxe với thêm rau tươi và cà chua.', 2);

-- 134. Hot ''N Spicy McChicken® Meal (Burgers/Chicken)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Hot ''N Spicy McChicken® Meal', 8.99, 'store_2_Hot_N_Spicy_McChicken_Meal_8.jpg', 55, 'Combo McChicken cay nồng hấp dẫn.', 2);

-- 135. Filet-O-Fish® Meal (Sandwiches)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Filet-O-Fish® Meal', 10.09, 'store_2_Filet-O-Fish_Meal_9.jpg', 40, 'Combo burger phi lê cá chiên xù phô mai.', 1);

-- 136. Double Filet-O-Fish® Meal (Sandwiches)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Double Filet-O-Fish® Meal', 12.49, 'store_2_Double_Filet-O-Fish_Meal_10.jpg', 35, 'Bữa ăn với burger cá hai lớp nhân đầy đặn.', 1);

-- 137. Bacon Cheeseburger (Burgers)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Bacon Cheeseburger', 3.19, 'store_2_Bacon_Cheeseburger_11.jpg', 60, 'Hamburger bò phô mai thêm thịt xông khói giòn.', 2);

-- 138. Hamburger (Burgers)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Hamburger', 1.89, 'store_2_Hamburger_12.jpg', 100, 'Hamburger bò truyền thống đơn giản mà ngon.', 2);

-- 139. Double Hamburger (Burgers)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Double Hamburger', 3.39, 'store_2_Double_Hamburger_13.jpg', 80, 'Hai lớp thịt bò nướng lửa hồng kẹp trong vỏ bánh mềm.', 2);

-- 140. McDouble® (Burgers)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('McDouble®', 3.89, 'store_2_McDouble_14.jpg', 90, 'Hai miếng thịt bò và một lát phô mai tan chảy.', 2);

-- 141. Bacon McDouble® (Burgers)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Bacon McDouble®', 4.29, 'store_2_Bacon_McDouble_15.jpg', 75, 'McDouble nâng cấp với thịt xông khói hun khói.', 2);

-- 142. Daily Double® (Burgers)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Daily Double®', 5.19, 'store_2_Daily_Double_16.jpg', 50, 'Hai miếng bò với rau xà lách và cà chua tươi.', 2);

-- 143. 20 pc. Chicken McNuggets® (Chicken)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('20 pc. Chicken McNuggets®', 8.31, 'store_2_20_pc_Chicken_McNuggets_17.jpg', 40, 'Hộp 20 miếng gà viên chiên giòn McNuggets.', 7);

-- 144. 40 pc. Chicken McNuggets® (Chicken)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('40 pc. Chicken McNuggets®', 14.48, 'store_2_40_pc_Chicken_McNuggets_18.jpg', 25, 'Đại tiệc 40 miếng gà viên cho cả gia đình.', 7);

-- 145. McChicken® (Burgers/Chicken)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('McChicken®', 3.49, 'store_2_McChicken_19.jpg', 85, 'Burger gà xay chiên xù với sốt mayonnaise.', 2);

-- 146. Hot ''N Spicy McChicken® (Burgers/Chicken)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Hot ''N Spicy McChicken®', 3.49, 'store_2_Hot_N_Spicy_McChicken_20.jpg', 80, 'Phiên bản McChicken cay cho người thích cảm giác mạnh.', 2);

-- 147. Filet-O-Fish® (Sandwiches)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Filet-O-Fish®', 5.29, 'store_2_Filet-O-Fish_22.jpg', 60, 'Burger cá biển chiên giòn với sốt Tartar.', 1);

-- 148. Double Filet-O-Fish® (Sandwiches)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Double Filet-O-Fish®', 7.39, 'store_2_Double_Filet-O-Fish_24.jpg', 50, 'Gấp đôi cá, gấp đôi vị ngon biển cả.', 1);

-- 149. Medium French Fries (Sides)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Medium French Fries', 3.69, 'store_2_Medium_French_Fries_26.jpg', 200, 'Khoai tây chiên vàng giòn nổi tiếng thế giới (Cỡ vừa).', 12);

-- 150. 4 pc. Chicken McNugget® Happy Meal® (Chicken)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('4 pc. Chicken McNugget® Happy Meal®', 5.99, 'store_2_4_pc_Chicken_McNugget_Happy_Meal_27.jpg', 60, 'Suất ăn trẻ em Happy Meal với 4 miếng gà viên.', 7);

-- 151. Hamburger Happy Meal® (Burgers)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Hamburger Happy Meal®', 5.69, 'store_2_Hamburger_Happy_Meal_28.jpg', 55, 'Suất ăn trẻ em Happy Meal với bánh Hamburger.', 2);

-- 152. 6 pc. Chicken McNuggets® Happy Meal® (Chicken)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('6 pc. Chicken McNuggets® Happy Meal®', 6.99, 'store_2_6_pc_Chicken_McNuggets_Happy_Meal_29.jpg', 50, 'Suất ăn trẻ em Happy Meal cỡ lớn với 6 miếng gà.', 7);

-- 153. 13 Cookie Tote (Desserts)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('13 Cookie Tote', 7.39, 'store_2_13_Cookie_Tote_31.jpg', 30, 'Túi 13 chiếc bánh quy sô cô la chip mềm.', 14);

-- 154. M&M® McFlurry® (Desserts)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('M&M® McFlurry®', 5.89, 'store_2_MM_McFlurry_32.jpg', 65, 'Kem McFlurry trộn kẹo sô cô la M&M nhiều màu sắc.', 14);

-- 155. Holiday Pie (Desserts)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Holiday Pie', 1.99, 'store_2_Holiday_Pie_34.jpg', 80, 'Bánh nướng nhân kem trứng sữa rắc hạt đường cầu vồng.', 14);

-- 156. Apple & Holiday Pie (Desserts)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Apple & Holiday Pie', 2.99, 'store_2_Apple__Holiday_Pie_35.jpg', 70, 'Cặp đôi bánh nướng táo và bánh nướng lễ hội.', 14);

-- 157. Medium Iced French Vanilla Latte (Drinks)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Medium Iced French Vanilla Latte', 3.69, 'store_2_Medium_Iced_French_Vanilla_Latte_36.jpg', 60, 'Cà phê Latte đá hương vani Pháp thơm nhẹ.', 15);

-- 158. Medium Cappuccino (Drinks)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Medium Cappuccino', 3.79, 'store_2_Medium_Cappuccino_37.jpg', 55, 'Cà phê Cappuccino nóng với lớp bọt sữa dày.', 15);

-- 159. Medium Vanilla Cappuccino (Drinks)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Medium Vanilla Cappuccino', 3.79, 'store_2_Medium_Vanilla_Cappuccino_38.jpg', 50, 'Cappuccino nóng pha thêm hương vani ngọt ngào.', 15);

-- 160. Medium Caramel Cappuccino (Drinks)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Medium Caramel Cappuccino', 3.79, 'store_2_Medium_Caramel_Cappuccino_39.jpg', 50, 'Cappuccino nóng kết hợp sốt caramel béo ngậy.', 15);

-- 161. Medium Americano (Drinks)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Medium Americano', 3.39, 'store_2_Medium_Americano_40.jpg', 60, 'Cà phê Americano đậm đà giúp tỉnh táo tức thì.', 15);

-- 162. 40 pc. Chicken McNuggets® & 2 Large Fries (Chicken)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('40 pc. Chicken McNuggets® & 2 Large Fries', 18.99, 'store_2_40_pc_Chicken_McNuggets__2_Large_Fries_41.jpg', 20, 'Combo tiệc tùng "siêu to" với 40 miếng gà và 2 khoai lớn.', 7);

-- 163. 20 pc. Chicken McNuggets® & 2 Medium Fries (Chicken)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('20 pc. Chicken McNuggets® & 2 Medium Fries', 14.02, 'store_2_20_pc_Chicken_McNuggets__2_Medium_Fries_42.jpg', 30, 'Combo chia sẻ hoàn hảo với 20 miếng gà và khoai chiên.', 7);

-- 164. Buffalo Ranch Sauce Cup (Sauces)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Buffalo Ranch Sauce Cup', 0.59, 'store_2_Buffalo_Ranch_Sauce_Cup_47.jpg', 150, 'Hộp sốt chấm Buffalo Ranch cay nhẹ béo ngậy.', 16);

-- 165. Creamy Chili McCrispy™ Strip Dip (Sauces)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Creamy Chili McCrispy™ Strip Dip', 0.59, 'store_2_Creamy_Chili_McCrispy_Strip_Dip_48.jpg', 150, 'Sốt ớt kem đặc biệt dành riêng cho gà McCrispy.', 16);

-- 166. Apple Slices (Sides)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Apple Slices', 0.99, 'store_2_Apple_Slices_49.jpg', 100, 'Táo tươi cắt lát, món tráng miệng lành mạnh.', 12);

-- 167. 3 Half Strips Bacon (Sides)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('3 Half Strips Bacon', 1.94, 'store_2_3_Half_Strips_Bacon_50.jpg', 80, '3 miếng thịt xông khói gọi thêm ăn kèm.', 12);

-- 168. Jalapenos Sliced (Sides)
INSERT INTO product (product_name, product_price, product_image, product_stock, product_description, category_id) 
VALUES ('Jalapenos Sliced', 0.35, 'store_2_Jalapenos_Sliced_51.jpg', 90, 'Ớt Jalapeno cắt lát thêm vị cay nồng cho món ăn.', 12);
