FasdUAS 1.101.10   ��   ��    k             l     ��  ��    ; 5 export_mailadresses.scpt exports all email addresses     � 	 	 j   e x p o r t _ m a i l a d r e s s e s . s c p t   e x p o r t s   a l l   e m a i l   a d d r e s s e s   
  
 l     ��  ��    ; 5 which you don't have already in your AddressBook.app     �   j   w h i c h   y o u   d o n ' t   h a v e   a l r e a d y   i n   y o u r   A d d r e s s B o o k . a p p      l     ��  ��    $  and which are not spam mails.     �   <   a n d   w h i c h   a r e   n o t   s p a m   m a i l s .      l     ��������  ��  ��        l     ��  ��      How to use:     �      H o w   t o   u s e :      l     ��  ��    %  1. Open AppleScript-Editor.app     �   >   1 .   O p e n   A p p l e S c r i p t - E d i t o r . a p p     !   l     �� " #��   " 8 2 2. Copy & Paste this script into the ScriptEditor    # � $ $ d   2 .   C o p y   &   P a s t e   t h i s   s c r i p t   i n t o   t h e   S c r i p t E d i t o r !  % & % l     �� ' (��   ' G A 3. Save this script somewhere, for example in ~/Library/Scripts/    ( � ) ) �   3 .   S a v e   t h i s   s c r i p t   s o m e w h e r e ,   f o r   e x a m p l e   i n   ~ / L i b r a r y / S c r i p t s / &  * + * l     �� , -��   ,   4. Open up Mail.app    - � . . (   4 .   O p e n   u p   M a i l . a p p +  / 0 / l     �� 1 2��   1 > 8 5. Create a new rule (you can find this in preferences)    2 � 3 3 p   5 .   C r e a t e   a   n e w   r u l e   ( y o u   c a n   f i n d   t h i s   i n   p r e f e r e n c e s ) 0  4 5 4 l     �� 6 7��   6 ? 9 6. Select "User is not in AddressBook" as the first rule    7 � 8 8 r   6 .   S e l e c t   " U s e r   i s   n o t   i n   A d d r e s s B o o k "   a s   t h e   f i r s t   r u l e 5  9 : 9 l     �� ; <��   ; "  7. Select "Run AppleScript"    < � = = 8   7 .   S e l e c t   " R u n   A p p l e S c r i p t " :  > ? > l     �� @ A��   @ ) # 8. Chose the script and press "OK"    A � B B F   8 .   C h o s e   t h e   s c r i p t   a n d   p r e s s   " O K " ?  C D C l     �� E F��   E I C 9. If it asks you to run this script on existing mails, press "No"    F � G G �   9 .   I f   i t   a s k s   y o u   t o   r u n   t h i s   s c r i p t   o n   e x i s t i n g   m a i l s ,   p r e s s   " N o " D  H I H l     �� J K��   J 8 2 10. Mark all emails you want to export mails from    K � L L d   1 0 .   M a r k   a l l   e m a i l s   y o u   w a n t   t o   e x p o r t   m a i l s   f r o m I  M N M l     �� O P��   O 0 * 11. In the menu use "Mail -> Apply Rules"    P � Q Q T   1 1 .   I n   t h e   m e n u   u s e   " M a i l   - >   A p p l y   R u l e s " N  R S R l     �� T U��   T F @ 12. Check the mail_export.csv file on your Desktop, you're done    U � V V �   1 2 .   C h e c k   t h e   m a i l _ e x p o r t . c s v   f i l e   o n   y o u r   D e s k t o p ,   y o u ' r e   d o n e S  W X W l     ��������  ��  ��   X  Y Z Y i      [ \ [ I      �� ]���� 0 perform_mail_action   ]  ^�� ^ o      ���� 0 info  ��  ��   \ k     Q _ _  ` a ` l     ��������  ��  ��   a  b c b O     O d e d k    N f f  g h g r     i j i m     k k � l l 2 ~ / D e s k t o p / m a i l _ e x p o r t . c s v j o      ���� 0 the_export_location   h  m n m r     o p o n     q r q o   	 ���� 0 SelectedMessages   r o    	���� 0 info   p o      ���� 0 the_messages   n  s�� s X    N t�� u t k    I v v  w x w r    ' y z y I   %�� {��
�� .emaleauautf8        utf8 { n    ! | } | 1    !��
�� 
sndr } o    ���� 0 	a_message  ��   z o      ���� 0 
the_sender   x  ~�� ~ Z   ( I  �����  >  ( - � � � l  ( + ����� � n   ( + � � � 1   ) +��
�� 
isjk � o   ( )���� 0 	a_message  ��  ��   � m   + ,��
�� boovtrue � I  0 E�� ���
�� .sysoexecTEXT���     TEXT � b   0 A � � � b   0 ? � � � b   0 = � � � b   0 ; � � � b   0 9 � � � b   0 7 � � � b   0 5 � � � b   0 3 � � � m   0 1 � � � � �  i f   !   g r e p   - q   � o   1 2���� 0 
the_sender   � m   3 4 � � � � �    � o   5 6���� 0 the_export_location   � m   7 8 � � � � � ( 
 	 	 	 	 t h e n 
 	 	 	 	 	 e c h o   � o   9 :���� 0 
the_sender   � m   ; < � � � � �    > >   � o   = >���� 0 the_export_location   � m   ? @ � � � � �  
 	 	 	 	 f i��  ��  ��  ��  �� 0 	a_message   u o    ���� 0 the_messages  ��   e m      � ��                                                                                  emal  alis    D  Macintosh HD               �9�cH+   ���Mail.app                                                        �E2Ə?        ����  	                Applications    �9�S      Ǝ�     ���  "Macintosh HD:Applications:Mail.app    M a i l . a p p    M a c i n t o s h   H D  Applications/Mail.app   / ��   c  ��� � l  P P��������  ��  ��  ��   Z  ��� � l     ��������  ��  ��  ��       �� � ���   � ���� 0 perform_mail_action   � �� \���� � ����� 0 perform_mail_action  �� �� ���  �  ���� 0 info  ��   � ������������ 0 info  �� 0 the_export_location  �� 0 the_messages  �� 0 	a_message  �� 0 
the_sender   �  � k�������������� � � � � ����� 0 SelectedMessages  
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
sndr
�� .emaleauautf8        utf8
�� 
isjk
�� .sysoexecTEXT���     TEXT�� R� L�E�O��,E�O ?�[��l kh ��,j E�O��,e �%�%�%�%�%�%�%�%j Y h[OY��UOP ascr  ��ޭ