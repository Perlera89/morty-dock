'use client'
import React from 'react'
import z from 'zod'
import { useForm } from 'react-hook-form'
import { zodResolver } from '@hookform/resolvers/zod'
import { Button } from "@/components/ui/button"
import {
  Form,
  FormControl,
  FormField,
  FormItem,
  FormLabel,
  FormMessage,
} from "@/components/ui/form"
import { Card,CardTitle,CardContent, CardHeader } from "@/components/ui/card"
import { Input } from "@/components/ui/input"

const formSchema = z.object({
  code:z.string().min(6, {message:'El codigo tiene que tener al menos 6 caracteres'}),
  name:z.string().min(2, {message:'El nombre tiene que tener al menos 2 caracteres'}),
  stock:z.string().refine(stock => !isNaN(parseInt(stock)), {message:'El stock tiene que ser un numero'}),
  minimunPrice:z.string().refine(stock => !isNaN(parseInt(stock)), {message:'El stock tiene que ser un numero'}),
  salePrice:z.string().refine(stock => !isNaN(parseInt(stock)), {message:'El stock tiene que ser un numero'}),
  iva:z.string().refine(stock => !isNaN(parseInt(stock)), {message:'El stock tiene que ser un numero'}),

}) 


export default function InsertProduct() {

  const form = useForm<z.infer<typeof formSchema>>({
    resolver: zodResolver(formSchema),
    defaultValues:{
      code:'',
      name:'',
      stock:'',
      minimunPrice:'',
      salePrice:'',
      iva:''
    }
  })
  
  function onSubmit(values : z.infer<typeof formSchema>){
    console.log(values)
  }
  return (<>
    <Form {...form}>  
      <form onSubmit={form.handleSubmit(onSubmit)} className="space-y-8">
      <Card >
        <CardHeader>
        <CardTitle >Product Info</CardTitle>
        </CardHeader>
        <CardContent>
        <FormField
          control={form.control}
          name="code"
          render={({ field }) => (
            <FormItem>
              <FormLabel>Code</FormLabel>
              <FormControl>
                <Input placeholder="0432353354343" {...field} />
              </FormControl>
              <FormMessage />
            </FormItem>
          )}
        />
        <FormField
          control={form.control}
          name="name"
          render={({ field }) => (
            <FormItem>
              <FormLabel>Name</FormLabel>
              <FormControl>
                <Input placeholder="Product Name" {...field} />
              </FormControl>
              <FormMessage />
            </FormItem>
          )}
        />
        <FormField
          control={form.control}
          name="stock"
          render={({ field }) => (
            <FormItem>
              <FormLabel>Stock</FormLabel>
              <FormControl>
                <Input placeholder="Product Stock" {...field} />
              </FormControl>
              <FormMessage />
            </FormItem>
          )}
        />

        <FormField
          control={form.control}
          name="minimunPrice"
          render={({ field }) => (
            <FormItem>
              <FormLabel>Minimun Price</FormLabel>
              <FormControl>
                <Input placeholder="Product Min Price" {...field} />
              </FormControl>
              <FormMessage />
            </FormItem>
          )}
        />
        <FormField
          control={form.control}
          name="salePrice"
          render={({ field }) => (
            <FormItem>
              <FormLabel>Sale Price</FormLabel>
              <FormControl>
                <Input placeholder="Product Sale Price" {...field} />
              </FormControl>
              <FormMessage />
            </FormItem>
          )}
        />
        <FormField
          control={form.control}
          name="iva"
          render={({ field }) => (
            <FormItem>
              <FormLabel>IVA</FormLabel>
              <FormControl>
                <Input placeholder="Product IVA" {...field} />
              </FormControl>
              <FormMessage />
            </FormItem>
          )}
        />
        </CardContent>
      </Card>
        <Button type="submit">Submit</Button>
      </form>
    </Form>
    </>
  )
}
