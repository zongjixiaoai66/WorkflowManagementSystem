/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb3 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP DATABASE IF EXISTS `t193`;
CREATE DATABASE IF NOT EXISTS `t193` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `t193`;

DROP TABLE IF EXISTS `config`;
CREATE TABLE IF NOT EXISTS `config` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='配置文件';

DELETE FROM `config`;

DROP TABLE IF EXISTS `dictionary`;
CREATE TABLE IF NOT EXISTS `dictionary` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_code` varchar(200) DEFAULT NULL COMMENT '字段',
  `dic_name` varchar(200) DEFAULT NULL COMMENT '字段名',
  `code_index` int DEFAULT NULL COMMENT '编码',
  `index_name` varchar(200) DEFAULT NULL COMMENT '编码名字  Search111 ',
  `super_id` int DEFAULT NULL COMMENT '父字段id',
  `beizhu` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 COMMENT='字典表';

DELETE FROM `dictionary`;
INSERT INTO `dictionary` (`id`, `dic_code`, `dic_name`, `code_index`, `index_name`, `super_id`, `beizhu`, `create_time`) VALUES
	(1, 'xiangmu_types', '项目类型', 1, '项目类型1', NULL, NULL, '2022-03-22 12:19:00'),
	(2, 'xiangmu_types', '项目类型', 2, '项目类型2', NULL, NULL, '2022-03-22 12:19:00'),
	(3, 'xiangmu_types', '项目类型', 3, '项目类型3', NULL, NULL, '2022-03-22 12:19:00'),
	(4, 'xiangmu_yesno_types', '项目审核', 1, '审核中', NULL, NULL, '2022-03-22 12:19:00'),
	(5, 'xiangmu_yesno_types', '项目审核', 2, '通过', NULL, NULL, '2022-03-22 12:19:00'),
	(6, 'xiangmu_yesno_types', '项目审核', 3, '拒绝', NULL, NULL, '2022-03-22 12:19:00'),
	(7, 'jiarudexiangmu_yesno_types', '加入审核', 1, '审核中', NULL, NULL, '2022-03-22 12:19:00'),
	(8, 'jiarudexiangmu_yesno_types', '加入审核', 2, '通过', NULL, NULL, '2022-03-22 12:19:00'),
	(9, 'jiarudexiangmu_yesno_types', '加入审核', 3, '拒绝', NULL, NULL, '2022-03-22 12:19:00'),
	(10, 'news_types', '公告类型', 1, '公告类型1', NULL, NULL, '2022-03-22 12:19:00'),
	(11, 'news_types', '公告类型', 2, '公告类型2', NULL, NULL, '2022-03-22 12:19:00'),
	(12, 'news_types', '公告类型', 3, '公告类型3', NULL, NULL, '2022-03-22 12:19:00'),
	(13, 'sex_types', '性别', 1, '男', NULL, NULL, '2022-03-22 12:19:00'),
	(14, 'sex_types', '性别', 2, '女', NULL, NULL, '2022-03-22 12:19:00');

DROP TABLE IF EXISTS `jiarudexiangmu`;
CREATE TABLE IF NOT EXISTS `jiarudexiangmu` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `xiangmu_id` int DEFAULT NULL COMMENT '项目',
  `yonghu_id` int DEFAULT NULL COMMENT '用户',
  `jiarudexiangmu_yesno_types` int DEFAULT NULL COMMENT '加入审核',
  `jiarudexiangmu_yesno_text` text COMMENT '审核结果',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COMMENT='加入的项目';

DELETE FROM `jiarudexiangmu`;
INSERT INTO `jiarudexiangmu` (`id`, `xiangmu_id`, `yonghu_id`, `jiarudexiangmu_yesno_types`, `jiarudexiangmu_yesno_text`, `create_time`) VALUES
	(6, 5, 1, 2, '通过', '2022-03-22 12:33:00'),
	(7, 5, 2, 2, '通过123', '2022-03-22 13:35:31'),
	(8, 5, 3, 2, '123', '2022-03-22 13:55:18'),
	(9, 5, 1, 3, '请不要重复加入', '2022-03-23 01:20:49');

DROP TABLE IF EXISTS `news`;
CREATE TABLE IF NOT EXISTS `news` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `news_name` varchar(200) DEFAULT NULL COMMENT '公告标题  Search111 ',
  `news_types` int DEFAULT NULL COMMENT '公告类型  Search111 ',
  `news_photo` varchar(200) DEFAULT NULL COMMENT '公告图片',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '公告时间',
  `news_content` text COMMENT '公告详情',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show1 show2 nameShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COMMENT='公告信息';

DELETE FROM `news`;
INSERT INTO `news` (`id`, `news_name`, `news_types`, `news_photo`, `insert_time`, `news_content`, `create_time`) VALUES
	(1, '公告标题1', 2, 'http://localhost:8080/gongzuoliuchengguanli/upload/news1.jpg', '2022-03-22 12:19:09', '公告详情1', '2022-03-22 12:19:09'),
	(2, '公告标题2', 1, 'http://localhost:8080/gongzuoliuchengguanli/upload/news2.jpg', '2022-03-22 12:19:09', '公告详情2', '2022-03-22 12:19:09'),
	(3, '公告标题3', 3, 'http://localhost:8080/gongzuoliuchengguanli/upload/news3.jpg', '2022-03-22 12:19:09', '公告详情3', '2022-03-22 12:19:09'),
	(4, '公告标题4', 3, 'http://localhost:8080/gongzuoliuchengguanli/upload/news4.jpg', '2022-03-22 12:19:09', '公告详情4', '2022-03-22 12:19:09'),
	(5, '公告标题5', 1, 'http://localhost:8080/gongzuoliuchengguanli/upload/news5.jpg', '2022-03-22 12:19:09', '公告详情5', '2022-03-22 12:19:09');

DROP TABLE IF EXISTS `token`;
CREATE TABLE IF NOT EXISTS `token` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COMMENT='token表';

DELETE FROM `token`;
INSERT INTO `token` (`id`, `userid`, `username`, `tablename`, `role`, `token`, `addtime`, `expiratedtime`) VALUES
	(1, 1, 'admin', 'users', '管理员', '04ihapolxfnl9gylwfyjjziieukv1jnh', '2022-03-22 11:45:21', '2024-05-14 09:59:48'),
	(2, 1, 'a1', 'yonghu', '用户', '410m0uzmcq3isjyrorifkq4fct96qxzh', '2022-03-22 12:00:57', '2024-05-14 10:00:37'),
	(3, 2, 'a2', 'yonghu', '用户', '416288qhpbug3qfoz7pg415mammf5ppd', '2022-03-22 13:38:42', '2022-03-23 02:21:03'),
	(4, 3, 'a3', 'yonghu', '用户', 'vcyqhl8puhpte2l9nqalu6b46e5ld3cu', '2022-03-22 13:55:11', '2022-03-23 02:22:30');

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='用户表';

DELETE FROM `users`;
INSERT INTO `users` (`id`, `username`, `password`, `role`, `addtime`) VALUES
	(1, 'admin', '123456', '管理员', '2022-04-30 16:00:00');

DROP TABLE IF EXISTS `xiangmu`;
CREATE TABLE IF NOT EXISTS `xiangmu` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `xiangmu_name` varchar(200) DEFAULT NULL COMMENT '项目名称  Search111 ',
  `xiangmu_photo` varchar(200) DEFAULT NULL COMMENT '项目封面',
  `xiangmu_types` int DEFAULT NULL COMMENT '项目类型 Search111',
  `xiangmu_address` varchar(200) DEFAULT NULL COMMENT '所属地点',
  `yonghu_id` int DEFAULT NULL COMMENT '项目负责人',
  `xiangmu_content` text COMMENT '项目简介 ',
  `xiangmu_yesno_types` int DEFAULT NULL COMMENT '项目审核',
  `xiangmu_yesno_text` text COMMENT '审核结果',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间  show1 show2 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COMMENT='项目信息';

DELETE FROM `xiangmu`;
INSERT INTO `xiangmu` (`id`, `xiangmu_name`, `xiangmu_photo`, `xiangmu_types`, `xiangmu_address`, `yonghu_id`, `xiangmu_content`, `xiangmu_yesno_types`, `xiangmu_yesno_text`, `insert_time`, `create_time`) VALUES
	(1, '项目名称1', 'http://localhost:8080/gongzuoliuchengguanli/upload/xiangmu1.jpg', 3, '所属地点1', 1, '项目简介1', 1, NULL, '2022-03-22 12:19:09', '2022-03-22 12:19:09'),
	(2, '项目名称2', 'http://localhost:8080/gongzuoliuchengguanli/upload/xiangmu2.jpg', 1, '所属地点2', 3, '项目简介2', 1, NULL, '2022-03-22 12:19:09', '2022-03-22 12:19:09'),
	(3, '项目名称3', 'http://localhost:8080/gongzuoliuchengguanli/upload/xiangmu3.jpg', 3, '所属地点3', 1, '项目简介3', 2, '通过2312', '2022-03-22 12:19:09', '2022-03-22 12:19:09'),
	(4, '项目名称4', 'http://localhost:8080/gongzuoliuchengguanli/upload/xiangmu4.jpg', 2, '所属地点4', 2, '项目简介4', 3, '拒绝', '2022-03-22 12:19:09', '2022-03-22 12:19:09'),
	(5, '项目名称5', 'http://localhost:8080/gongzuoliuchengguanli/upload/xiangmu5.jpg', 3, '所属地点5', 2, '项目简介5', 2, '审核通过', '2022-03-22 12:19:09', '2022-03-22 12:19:09');

DROP TABLE IF EXISTS `xiangmujindu`;
CREATE TABLE IF NOT EXISTS `xiangmujindu` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `yonghu_id` int DEFAULT NULL COMMENT '用户',
  `xiangmu_id` int DEFAULT NULL COMMENT '项目信息',
  `xiangmujindu_text` text COMMENT '项目进度',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '添加时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间  show1 show2 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COMMENT='项目进度';

DELETE FROM `xiangmujindu`;
INSERT INTO `xiangmujindu` (`id`, `yonghu_id`, `xiangmu_id`, `xiangmujindu_text`, `insert_time`, `create_time`) VALUES
	(6, 1, 5, '项目进度213', '2022-03-22 12:43:56', '2022-03-22 12:43:56'),
	(7, 2, 5, '123', '2022-03-22 13:21:26', '2022-03-22 13:21:26'),
	(8, 2, 5, '发布项目的用户2添加项目进度', '2022-03-23 01:21:49', '2022-03-23 01:21:49'),
	(9, 2, 4, '项目进度23', '2022-03-23 01:22:14', '2022-03-23 01:22:14');

DROP TABLE IF EXISTS `yonghu`;
CREATE TABLE IF NOT EXISTS `yonghu` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `yonghu_name` varchar(200) DEFAULT NULL COMMENT '用户姓名 Search111 ',
  `yonghu_photo` varchar(255) DEFAULT NULL COMMENT '头像',
  `sex_types` int DEFAULT NULL COMMENT '性别 Search111 ',
  `yonghu_phone` varchar(200) DEFAULT NULL COMMENT '联系方式',
  `yonghu_id_number` varchar(200) DEFAULT NULL COMMENT '身份证号 ',
  `yonghu_email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `yonghu_delete` int DEFAULT '1' COMMENT '假删',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='用户';

DELETE FROM `yonghu`;
INSERT INTO `yonghu` (`id`, `username`, `password`, `yonghu_name`, `yonghu_photo`, `sex_types`, `yonghu_phone`, `yonghu_id_number`, `yonghu_email`, `yonghu_delete`, `create_time`) VALUES
	(1, '用户1', '123456', '用户姓名1', 'http://localhost:8080/gongzuoliuchengguanli/upload/yonghu1.jpg', 2, '17703786901', '410224199610232001', '1@qq.com', 1, '2022-03-22 12:19:09'),
	(2, '用户2', '123456', '用户姓名2', 'http://localhost:8080/gongzuoliuchengguanli/upload/yonghu2.jpg', 2, '17703786902', '410224199610232002', '2@qq.com', 1, '2022-03-22 12:19:09'),
	(3, '用户3', '123456', '用户姓名3', 'http://localhost:8080/gongzuoliuchengguanli/upload/yonghu3.jpg', 2, '17703786903', '410224199610232003', '3@qq.com', 1, '2022-03-22 12:19:09');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
