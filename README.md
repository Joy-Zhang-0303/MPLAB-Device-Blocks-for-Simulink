# MPLAB Device Blocks for Simulink

**Microchip official blockset v3.45** supporting up to 300 microcontrollers.

Download [zip](https://github.com/LubinKerhuel/MPLAB-Device-Blocks-for-Simulink/archive/master.zip) package.

This support package enables code generation of real-time executable for dsPIC :registered:, PIC32 :registered: and SAM7x from a Simulink model.

![MPLAB Device Blocks for Simulink](MPLAB_Blockset.jpg)

Peripheral blocks configure and inserts code in the code generated by the MW embedded coder. (non-exhaustive peripheral block list: ADC, QEI, PWM, IC, OC, CN, I2C, SPI, UART, Op-Amp, Comparator, DAC...)

Code is generated, compiled and uploaded into your board from the single "Build" button on top right of Simulink models.

No embedded programming knowledge is required. The toolbox transforms any board equipped with a supported MCU into a rapid control prototyping tool and enable a model-based design development scheme.

## Features

A single-tasking or multi-tasking scheduler implement efficiently advanced multi-rate models.

Advanced configuration of ADC coupled with PWM peripheral enable PMSM motor algorithm where ADC sample time must be triggered precisely within a PWM duty-cycle. The time step might also be triggered by end of ADC conversion minimizing delays.

A custom protocol allows visualizing and recording data through the UART. The custom picgui interface allows plotting using your own matlab script incoming data in real-time. Data log enable further analysis or offline identification and allow to feed a simulation with real data.

The custom "C function" block allows including your own code if required.

The blockset also support MathWorks features like:

- Hardware in the loop (HIL)
- External mode features.
- Code replacement to benefit from DSP architecture of dsPIC

This version embed a third part tool adding blocks for UAVs projects (GPS, MAVLink, Receiver S.BUS, S.Port and F.Port blocks for dsPIC). Type picInfo to find out how to install the UxV blocks.

## Requirements

- MathWorks 
  - Matlab (from R2010a to R2019a)
  - Simulink
  - Embedded Coder
  - Simulink Coder
  - Matlab Coder
- Microchip
  - MPLAB X IDE [download](https://www.microchip.com/MPLABX)
  - xc16 compiler for 16 bits devices [download](https://www.microchip.com/xc16) (dsPIC)
  - xc32 compiler for 32 bits devices [download](https://www.microchip.com/xc32) (PIC32, SAMx7)

## Installation

1. [download](https://github.com/LubinKerhuel/MPLAB-Device-Blocks-for-Simulink/archive/master.zip) and unzip the package
2. execute the .p installer script . Within Matlab, right click on file install.p and select run.

The MCHP\_example folder is created in the current folder and examples copied into.

### Supported MCU

1. 30F2010
2. 30F2011
3. 30F2012
4. 30F3010
5. 30F3011
6. 30F3012
7. 30F3013
8. 30F3014
9. 30F4011
10. 30F4012
11. 30F4013
12. 30F5011
13. 30F5013
14. 30F5015
15. 30F5016
16. 30F6010
17. 30F6011
18. 30F6012
19. 30F6013
20. 30F6014
21. 30F6015
22. 33CH128MP502
23. 33CH128MP503
24. 33CH128MP505
25. 33CH128MP506
26. 33CH128MP508
27. 33CH512MP505
28. 33CH512MP506
29. 33CH512MP508
30. 33CK256MP508
31. 33CK32MP102
32. 33CK32MP103
33. 33CK32MP105
34. 33CK64MP102
35. 33CK64MP103
36. 33CK64MP105
37. 33EP128GM304
38. 33EP128GM306
39. 33EP128GM310
40. 33EP128GM604
41. 33EP128GM706
42. 33EP128GM710
43. 33EP128GP502
44. 33EP128GP504
45. 33EP128GP506
46. 33EP128GS702
47. 33EP128GS704
48. 33EP128GS705
49. 33EP128GS706
50. 33EP128GS708
51. 33EP128GS804
52. 33EP128GS805
53. 33EP128GS806
54. 33EP128GS808
55. 33EP128MC202
56. 33EP128MC204
57. 33EP128MC206
58. 33EP128MC502
59. 33EP128MC504
60. 33EP128MC506
61. 33EP16GS202
62. 33EP16GS502
63. 33EP16GS504
64. 33EP16GS505
65. 33EP16GS506
66. 33EP256GM304
67. 33EP256GM306
68. 33EP256GM310
69. 33EP256GM604
70. 33EP256GM706
71. 33EP256GM710
72. 33EP256GP502
73. 33EP256GP504
74. 33EP256GP506
75. 33EP256MC202
76. 33EP256MC204
77. 33EP256MC206
78. 33EP256MC502
79. 33EP256MC504
80. 33EP256MC506
81. 33EP256MU806
82. 33EP256MU810
83. 33EP256MU814
84. 33EP32GP502
85. 33EP32GP503
86. 33EP32GP504
87. 33EP32GS202
88. 33EP32GS502
89. 33EP32GS504
90. 33EP32GS505
91. 33EP32GS506
92. 33EP32MC202
93. 33EP32MC203
94. 33EP32MC204
95. 33EP32MC502
96. 33EP32MC503
97. 33EP32MC504
98. 33EP512GM304
99. 33EP512GM306
100. 33EP512GM310
101. 33EP512GM604
102. 33EP512GM706
103. 33EP512GM710
104. 33EP512GP502
105. 33EP512GP504
106. 33EP512GP506
107. 33EP512GP806
108. 33EP512MC202
109. 33EP512MC204
110. 33EP512MC206
111. 33EP512MC502
112. 33EP512MC504
113. 33EP512MC506
114. 33EP512MC806
115. 33EP512MU810
116. 33EP512MU814
117. 33EP64GP502
118. 33EP64GP503
119. 33EP64GP504
120. 33EP64GP506
121. 33EP64GS502
122. 33EP64GS504
123. 33EP64GS505
124. 33EP64GS506
125. 33EP64GS708
126. 33EP64GS804
127. 33EP64GS805
128. 33EP64GS806
129. 33EP64GS808
130. 33EP64MC202
131. 33EP64MC203
132. 33EP64MC204
133. 33EP64MC206
134. 33EP64MC502
135. 33EP64MC503
136. 33EP64MC504
137. 33EP64MC506
138. 33EV128GM002
139. 33EV128GM003
140. 33EV128GM004
141. 33EV128GM006
142. 33EV128GM102
143. 33EV128GM103
144. 33EV128GM104
145. 33EV128GM106
146. 33EV256GM002
147. 33EV256GM003
148. 33EV256GM004
149. 33EV256GM006
150. 33EV256GM102
151. 33EV256GM103
152. 33EV256GM104
153. 33EV256GM106
154. 33EV32GM002
155. 33EV32GM003
156. 33EV32GM004
157. 33EV32GM006
158. 33EV32GM102
159. 33EV32GM103
160. 33EV32GM104
161. 33EV32GM106
162. 33EV64GM002
163. 33EV64GM003
164. 33EV64GM004
165. 33EV64GM006
166. 33EV64GM102
167. 33EV64GM103
168. 33EV64GM104
169. 33EV64GM106
170. 33FJ128GP202
171. 33FJ128GP204
172. 33FJ128GP206
173. 33FJ128GP206A
174. 33FJ128GP306
175. 33FJ128GP306A
176. 33FJ128GP310
177. 33FJ128GP310A
178. 33FJ128GP706
179. 33FJ128GP706A
180. 33FJ128GP708
181. 33FJ128GP708A
182. 33FJ128GP710
183. 33FJ128GP710A
184. 33FJ128GP802
185. 33FJ128GP804
186. 33FJ128MC202
187. 33FJ128MC204
188. 33FJ128MC506
189. 33FJ128MC506A
190. 33FJ128MC510
191. 33FJ128MC510A
192. 33FJ128MC706
193. 33FJ128MC706A
194. 33FJ128MC708
195. 33FJ128MC708A
196. 33FJ128MC710
197. 33FJ128MC710A
198. 33FJ128MC802
199. 33FJ128MC804
200. 33FJ12GP201
201. 33FJ12GP202
202. 33FJ12MC201
203. 33FJ12MC202
204. 33FJ16GP304
205. 33FJ16MC304
206. 33FJ256GP506
207. 33FJ256GP506A
208. 33FJ256GP510
209. 33FJ256GP510A
210. 33FJ256GP710
211. 33FJ256GP710A
212. 33FJ256MC510
213. 33FJ256MC510A
214. 33FJ256MC710
215. 33FJ256MC710A
216. 33FJ32GP202
217. 33FJ32GP204
218. 33FJ32GP302
219. 33FJ32GP304
220. 33FJ32MC202
221. 33FJ32MC204
222. 33FJ32MC302
223. 33FJ32MC304
224. 33FJ64GP202
225. 33FJ64GP204
226. 33FJ64GP206
227. 33FJ64GP206A
228. 33FJ64GP306
229. 33FJ64GP306A
230. 33FJ64GP310
231. 33FJ64GP310A
232. 33FJ64GP706
233. 33FJ64GP706A
234. 33FJ64GP708
235. 33FJ64GP708A
236. 33FJ64GP710
237. 33FJ64GP710A
238. 33FJ64GP802
239. 33FJ64GP804
240. 33FJ64MC202
241. 33FJ64MC204
242. 33FJ64MC506
243. 33FJ64MC506A
244. 33FJ64MC508
245. 33FJ64MC508A
246. 33FJ64MC510
247. 33FJ64MC510A
248. 33FJ64MC706
249. 33FJ64MC706A
250. 33FJ64MC710
251. 33FJ64MC710A
252. 33FJ64MC802
253. 33FJ64MC804
254. 32MK0512MCF064
255. 32MK0512MCF100
256. 32MK0512MCM064
257. 32MK0512MCM100
258. 32MK1024MCF064
259. 32MK1024MCF100
260. 32MK1024MCM064
261. 32MK1024MCM100
262. 32MZ1024EFG064
263. 32MZ1024EFG100
264. 32MZ1024EFG124
265. 32MZ1024EFG144
266. 32MZ1024EFH064
267. 32MZ1024EFH100
268. 32MZ1024EFH124
269. 32MZ1024EFH144
270. 32MZ1024EFM064
271. 32MZ1024EFM100
272. 32MZ1024EFM124
273. 32MZ1024EFM144
274. 32MZ2048EFG064
275. 32MZ2048EFG100
276. 32MZ2048EFG124
277. 32MZ2048EFG144
278. 32MZ2048EFH064
279. 32MZ2048EFH100
280. 32MZ2048EFH124
281. 32MZ2048EFH144
282. 32MZ2048EFM064
283. 32MZ2048EFM100
284. 32MZ2048EFM124
285. 32MZ2048EFM144
286. SAME70J19B - LQFP64
287. SAME70J20B - LQFP64
288. SAME70J21B - LQFP64
289. SAME70N19B - TFBGA100
290. SAME70N19B - LQFP100
291. SAME70N20B - TFBGA100
292. SAME70N20B - LQFP100
293. SAME70N21B - TFBGA100
294. SAME70N21B - LQFP100
295. SAME70Q19B - TFBGA_LFBGA_144
296. SAME70Q19B - UFBGA144
297. SAME70Q19B - LQFP144
298. SAME70Q20B - TFBGA_LFBGA_144
299. SAME70Q20B - UFBGA144
300. SAME70Q20B - LQFP144
301. SAME70Q21B - TFBGA_LFBGA_144
302. SAME70Q21B - UFBGA144
303. SAME70Q21B - LQFP144
304. SAMS70J19B - LQFP64
305. SAMS70J19B - QFN64
306. SAMS70J20B - LQFP64
307. SAMS70J20B - QFN64
308. SAMS70J21B - LQFP64
309. SAMS70J21B - QFN64
310. SAMS70N19B - TFBGA100
311. SAMS70N19B - VFBGA100
312. SAMS70N19B - LQFP100
313. SAMS70N20B - TFBGA100
314. SAMS70N20B - VFBGA100
315. SAMS70N20B - LQFP100
316. SAMS70N21B - TFBGA100
317. SAMS70N21B - VFBGA100
318. SAMS70N21B - LQFP100
319. SAMS70Q19B - TFBGA_LFBGA_144
320. SAMS70Q19B - UFBGA144
321. SAMS70Q19B - LQFP144
322. SAMS70Q20B - TFBGA_LFBGA_144
323. SAMS70Q20B - UFBGA144
324. SAMS70Q20B - LQFP144
325. SAMS70Q21B - TFBGA_LFBGA_144
326. SAMS70Q21B - UFBGA144
327. SAMS70Q21B - LQFP144
328. SAMV70J19B - LQFP64
329. SAMV70J20B - LQFP64
330. SAMV70N19B - TFBGA100
331. SAMV70N19B - LQFP100
332. SAMV70N20B - TFBGA100
333. SAMV70N20B - LQFP100
334. SAMV70Q19B - TFBGA_LFBGA_144
335. SAMV70Q19B - LQFP144
336. SAMV70Q20B - TFBGA_LFBGA_144
337. SAMV70Q20B - LQFP144