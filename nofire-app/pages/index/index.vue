<template >
	<view class="content">
	
	    <u-row gutter="16">
			<u-col span="3">
				<image class="logo" src="/static/logo.png"></image>
			</u-col>
			<u-col span="9">
				<text class="te">智慧消防管理平台</text>
			</u-col>
		</u-row>
			
			

		
	 
		<u-form-item :leftIconStyle="{ color: '#888', fontSize: '32rpx' }" left-icon="account" label-width="120" label-position="top" label="设备名称" prop="name">
			<u-input :border="border" placeholder="请输入设备名称" v-model="name" type="text" ></u-input>
		</u-form-item>
		<u-form-item :leftIconStyle="{ color: '#888', fontSize: '32rpx' }" left-icon="account" label-width="120" label-position="top" label="地址" prop="address">
			<u-input :border="border" placeholder="请输入地址" v-model="address" type="text" ></u-input>
		</u-form-item>
		<u-form-item label-position="top" label="告警等级" prop="age" label-width="150">
			<u-input :border="border" type="select" :select-open="selectShow" v-model="age" placeholder="请选择告警等级" @click="selectShow = true"></u-input>
		</u-form-item>
		<u-form-item label-position="top" label="告警类型" prop="type" label-width="150">
			<u-input :border="border" type="select" :select-open="selectShow2" v-model="type" placeholder="请选择告警类型" @click="selectShow2 = true"></u-input>
		</u-form-item>
		
		<view class="text-area">
			<u-button @click="btnClick" data-name="3333" shape="circle" size="default" :ripple="ripple" type="primary">火情报警</u-button>
		</view>
		<u-select mode="single-column" :list="selectList" v-model="selectShow" @confirm="selectConfirm"></u-select>
		<u-select mode="single-column" :list="selectList2" v-model="selectShow2" @confirm="selectConfirm2"></u-select>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				name: '',
				age: '',
				agex: 0,
				type: '',
				selectShow: false,
				selectShow2: false,
				border:true,
				selectList: [
					{
						value: '一级',
						label: '一级'
					},
					{
						value: '二级',
						label: '二级'
					},
					{
						value: '三级',
						label: '三级'
					},
				],
				selectList2: [
					{
						value: '感烟告警',
						label: '感烟告警'
					},
					{
						value: '感温告警',
						label: '感温告警'
					},
					{
						value: '红外探测告警',
						label: '红外探测告警'
					},
				],
				address: '',
				title: 'Hello',
				ripple:  true
			}
		},
		onLoad() {

		},
		methods: {
            btnClick() {
				if(this.age == "一级"){
					this.agex = 1
				}else if(this.age == "二级"){
					this.agex = 2
				}else{
					this.agex = 3
				}
            	uni.request({
            		url:"http://192.168.43.30:8081/ifp/mbpost",
					method:"POST",
					header:{
					  'Content-Type': 'application/json'
					},
					data:{
						"deviceName": this.name,
						"alarmLevel": this.agex,
					    "address": this.address,
						"alarmType": this.type
					},
					dataType:"json",
					success: (res) => {
						if(res.data == "success"){
							this.$u.toast('发出警报成功!!')
						}
					}
            	})
            },
			selectConfirm(e) {
				this.age = '';
				e.map((val, index) => {
					this.age += this.age == '' ? val.label : '-' + val.label;
				})
			},
			selectConfirm2(e) {
				this.type = '';
				e.map((val, index) => {
					this.type += this.type == '' ? val.label : '-' + val.label;
				})
			},
		}
	}
</script>

<style>
	.content {
		margin:50rpx;
	}
	
	.logo {
		height: 100rpx;
		width: 100rpx;
		margin-top: 50rpx;
		margin-bottom: 50rpx;
		float: right;
	}

	.text-area {
		display: flex;
		margin-top: 80rpx;
		justify-content: center;
	}

	.title {
		font-size: 36rpx;
		color: #8f8f94;
	}
	
	.te{
		font-size: 55rpx;
		color: #2979FF;
	}
</style>
